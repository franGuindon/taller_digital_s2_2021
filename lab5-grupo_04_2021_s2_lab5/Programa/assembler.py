# from riscv_assembler.convert import AssemblyConverter
# cnv = AssemblyConverter(output_type = "p", nibble = True, hexMode = False)
# cnv.convert('main.s')

def is_not_empty_or_comment(line):
    line = line.strip()
    if line == "":
        return False
    if line[0] in "#/;":
        return False
    return True

def strip_comment(line):
    find_bs = line.find('/')
    find_num = line.find('#')
    find_sc = line.find(';')
    pos_idx = [
        idx for idx in [find_bs, find_num, find_sc]
        if idx != -1
    ]
    if pos_idx == []:
        return line
    idx = min(pos_idx)
    return line[:idx]

def tokenize(lines):
    lines = [line.strip().split() for line in lines]
    return lines

def is_label(line):
    if len(line) == 1 and line[0][-1] == ':':
        return True
    return False

def is_var(line):
    if len(line) == 3 and line[1] == '=':
        return True
    return False

def is_directive(line):
    if line[0][0] == '.':
        return True
    return False

def get_int(string):
    if string[:2].lower() == '0x':
        return int(string, 16)
    if string[:2].lower() == '0d':
        return int(string[2:], 10)
    if string[:2].lower() == '0b':
        return int(string, 2)
    return int(string, 10)

instrs = { # type, opcode, funct3, funct7
    'and' : ['R', 0b0110011, 0b111, 0b000000],
    'or' : ['R', 0b0110011, 0b110, 0b000000],
    'sub' : ['R', 0b0110011, 0b000, 0b010000],
    'add' : ['R', 0b0110011, 0b000, 0b000000],
    'sll' : ['R', 0b0110011, 0b001, 0b000000],
    'srl' : ['R', 0b0110011, 0b101, 0b000000],
    'addi' : ['I_A', 0b0010011, 0b111, None],
    'lw' : ['I_A', 0b0000011, 0b010, None],
    'andi' : ['I_L', 0b0010011, 0b111, None],
    'ori' : ['I_L', 0b0010011, 0b110, None],
    'jal' : ['J', 0b1101111, None, None],
    'beq' : ['B', 0b1100011, 0b000, None],
    'sw' : ['S', 0b0100011, 0b010, None],
}

def is_instr(line):
    return line[0].lower() in instrs

def parse_labels(lines):
    linenum_active = False
    curr_linenum = 0
    LABELS = {}
    VARS = {}

    for line in lines:
        if is_label(line) and linenum_active:
            LABELS[line[0][:-1]] = str(curr_linenum)
        if is_var(line):
            VARS[line[0]] = line[2]
        if is_directive(line):
            if line[0] == '.text':
                linenum_active = True
        if is_instr(line):
            curr_linenum += 1
    
    parsed_lines = []
    
    parse_offset = lambda offset: (
        LABELS[offset] if offset in LABELS
        else VARS[offset] if offset in VARS
        else offset
    )

    for line in lines:
        instr = line[0].lower()
        parsed_line = line
        if instr in ['lw', 'sw']:
            offset, base = line[2].split('(')
            base = base[:-1]
            offset = parse_offset(offset)
            parsed_line = [line[0], line[1], base, offset]
        if instr == 'beq':
            offset = line[3]
            offset = parse_offset(offset)
            parsed_line = [line[0], line[1], line[2], offset]
        if instr == 'jal':
            offset = line[2]
            offset = parse_offset(offset)
            parsed_line = [line[0], line[1], offset]
        if is_label(line) or is_var(line) or is_directive(line):
            continue
        parsed_lines.append(parsed_line)
    return parsed_lines

def parse_regs(lines):
    # funct7 | rs2 | rs1 | funct3 | rd | opcode
    parsed_lines = []
    for line in lines:
        parsed_line = []
        for token in line:
            token = token[1:] if token[0] == 'x' else token
            parsed_line.append(token)
        parsed_lines.append(parsed_line)
    return parsed_lines

def parse_instrs(lines):
    parsed_lines = []
    for line in lines:
        instr, *args = line
        parsed_line = [instrs[instr], *args]
        parsed_lines.append(parsed_line)
    return parsed_lines

def extend(imm, symb_type):
    imm = bin(imm)
    sgn = '1' if imm[0] == '-' else '0'
    imm = imm[3:] if sgn == '1' else imm[2:]
    num_sgn_to_add = 32 - len(imm)
    symb = sgn if symb_type=='sgn' else '0'
    imm = symb*num_sgn_to_add + imm
    return imm

def parse_imms(lines):
    parsed_lines = []
    for line in lines:
        instr_type = line[0][0]
        *line, imm = line
        if instr_type != 'R':
            imm = get_int(imm)
        if instr_type == 'I_A':
            imm = [extend(imm, 'sgn')]
        if instr_type == 'I_L':
            imm = [extend(imm, 'zero')]
        if instr_type == 'B':
            imm = extend(imm, 'sgn') + '0'
            imm_1 = imm[12] + imm[5:11]
            imm_2 = imm[1:5] + imm[11]
            imm = [imm_1, imm_2]
        if instr_type == 'J':
            imm = [extend(imm, 'sgn')]
        if instr_type == 'S':
            imm = [extend(imm, 'sgn')]

        parsed_line = [*line, imm]
        parsed_lines.append(parsed_line)
    return parsed_lines

def generate_word_list(lines):
    byte_list = []

def main():
    with open('main.s') as s_file:
        data = s_file.read()

    data_lines = data.split('\n')
    data_lines = [strip_comment(line) for line in data_lines if is_not_empty_or_comment(line)]
    data_lines = tokenize(data_lines)
    data_lines = parse_labels(data_lines)
    #data_lines = parse_regs(data_lines)
    #data_lines_2 = parse_instrs(data_lines)
    #data_lines_2 = parse_imms(data_lines_2)
    #word_list = generate_word_list(data_lines)
    [print(line) for line in data_lines]

def write_coe(filepath):
    with open(filepath) as f:
        data = f.read()
    data = ', '.join(data.split())
    with open('main.coe','w') as f:
        f.write("memory_initialization_radix = 2;\n")
        f.write("memory_initialization_vector = ")
        f.write(data)
        f.write(";")
    
def write_mem(filepath, filename):
    with open(filepath) as f:
        data = f.read()
    data = ''.join(data.split('0x'))
    with open(filename + '.mem','w') as f:
        f.write(data)
    
def test():
    from riscv_assembler.convert import AssemblyConverter
    from riscv_assembler.utils import Toolkit
    import shutil
    cnv = AssemblyConverter(output_type = 'pt', hexMode = True)
    filename = 'main' # 'main'
    cnv.convert(filename + '.s')
    filepath = filename + '/txt/' + filename  + '.txt'
    
    write_mem(filepath, filename)
    shutil.rmtree(filename + "/")
    
if __name__ == '__main__':
    #main()
    test()
