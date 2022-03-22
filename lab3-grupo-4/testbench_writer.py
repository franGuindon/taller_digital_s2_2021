import sys
import os
import warnings

class FileNotVerilogWarning(Warning):
    pass

class VerilogModuleStructure():

    def get_module_name():
        self.text
        self.module_name = 1
    
    def get_structure_from_verilog_text(self, verilog_filetext):
        self.text = verilog_filetext
        self.get_module_name()

def first_command_line_argument_is_same_as_this_script():
    first_command_line_argument = os.path.basename(sys.argv[0])
    this_script = os.path.basename(__file__)
    return first_command_line_argument == this_script

def check_file_exists(filename):
    if not os.path.isfile(filename):
        raise FileNotFoundError(f'The file {filename} does not exist')

def check_file_is_verilog(filename):
    if not filename.endswith('.v'):
        warnings.warn(FileNotVerilogWarning)
    
def get_second_command_line_argument_as_verilog_filename():
    verilog_filename = os.path.basename(sys.argv[1])
    check_file_exists(verilog_filename)
    check_file_is_verilog(verilog_filename)
    return verilog_filename

def get_verilog_testbench_filename(filename):
    filename_without_extension, extension = os.path.splitext(filename)
    return filename_without_extension + '_tb' + extension

def get_verilog_module_structure_from_file(filename):
    with open(filename, 'r') as verilog_filedata:
        verilog_filetext = verilog_filedata.read()
    verilog_module_structure = VerilogModuleStructure()
    verilog_module_structure.get_structure_from_verilog_text(verilog_filetext)
    return verilog_module_structure

def main():
    verilog_filename = get_second_command_line_argument_as_verilog_filename()
    testbench_filename = get_verilog_testbench_filename(verilog_filename)
    verilog_module_structure = get_verilog_module_structure_from_file(verilog_filename)
    print(testbench_filename)

if __name__ == '__main__':
    if first_command_line_argument_is_same_as_this_script():
        main()
