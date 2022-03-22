import random
from abc import ABC, abstractmethod

def myBin(val, width):
    binval = bin(val)[2:]
    binval = clip_if_necessary(binval, width)
    binval = pad_if_necessary(binval, width)
    return binval

def clip_if_necessary(val, width):
    return val[-width:] if len(val) > width else val

def pad_if_necessary(val, width):
    return "0"*(width-len(val))+val if width > len(val) else val

class dat_writer(ABC):

    @abstractmethod
    def create_test_string(self):
        NotImplemented

    def mat_to_str(self, mat):
        lines = [" ".join(line) for line in mat]
        mat_as_str = "\n".join(lines)
        return mat_as_str
        
    def create_dat_file(self, filename):
        with open(filename,'w') as f:
            test_str = self.create_test_string()
            f.write(test_str)
        
class adder_cla_tb_dat_writer(dat_writer):
    def __init__(self):
        self.data_width = 4
        self.num_of_data_vals = 2**self.data_width
        self.data_vals_list = range(num_of_data_vals)

    def create_test_matrix(self):
        data_width = self.data_width
        test_mat = [
            [myBin(Cin, 1),
             myBin(A, data_width),
             myBin(B, data_width),
             myBin(Cin + A + B, data_width + 1)[0],
             myBin(Cin + A + B, data_width + 1)[1:]]
            for Cin in [0, 1]
            for A in self.data_vals_list
            for B in self.data_vals_list
        ]
        return test_mat
        
    def create_test_string(self):
        mat = self.create_test_matrix()
        mat_str = self.mat_to_str(mat)
        return mat_str

class regfile_tb_dat_writer(dat_writer):

    def __init__(self):
        self.addr_width = 3
        self.num_of_registers = 2**self.addr_width

        self.data_width = 8
        self.num_of_data_vals = 2**self.data_width

    def create_reset_test(self):
        addr_width = self.addr_width
        num_of_registers = self.num_of_registers

        data_width = self.data_width
        num_of_data_vals = self.num_of_data_vals
        
        addr_rs1 = 0
        addr_rs2 = 0
        addr_rd = 0
        we = 0
        rst = 1
        data_in = 0
        rs1 = 0
        rs2 = 0
        reset_test = [
            [myBin(addr_rs1, addr_width),
             myBin(addr_rs2, addr_width),
             myBin(addr_rd, addr_width),
             myBin(we, 1),
             myBin(rst, 1),
             myBin(data_in, data_width),
             myBin(rs1, data_width),
             myBin(rs2, data_width)]
        ]
        return reset_test
        
    def create_write_test(self):
        addr_width = self.addr_width
        num_of_registers = self.num_of_registers

        data_width = self.data_width
        num_of_data_vals = self.num_of_data_vals
        
        addr_rs1 = 0
        addr_rs2 = 0
        addr_rd_list = range(num_of_registers)
        we = 1
        rst = 0
        data_in_list = [random.randrange(num_of_data_vals) for reg in range(num_of_registers)]
        rs1 = data_in_list[addr_rs1]
        rs2 = data_in_list[addr_rs2]
        write_test = [
            [myBin(addr_rs1, addr_width),
             myBin(addr_rs2, addr_width),
             myBin(addr_rd, addr_width),
             myBin(we, 1),
             myBin(rst, 1),
             myBin(data_in, data_width),
             myBin(rs1, data_width),
             myBin(rs2, data_width)]
            for addr_rd, data_in in zip(addr_rd_list, data_in_list)
        ]
        return write_test, data_in_list

    def create_read_test(self, data_in_list):
        addr_width = self.addr_width
        num_of_registers = self.num_of_registers

        data_width = self.data_width
        num_of_data_vals = self.num_of_data_vals
        
        addr_rs1_list = list(range(num_of_registers))
        addr_rs2_list = list(range(num_of_registers))
        random.shuffle(addr_rs1_list)
        random.shuffle(addr_rs2_list)
        addr_rd = 0
        we = 0
        rst = 0
        data_in = 0
        rs1_list = [data_in_list[addr_rs1] for addr_rs1 in addr_rs1_list]
        rs2_list = [data_in_list[addr_rs2] for addr_rs2 in addr_rs2_list]
        read_test = [
            [myBin(addr_rs1, addr_width),
             myBin(addr_rs2, addr_width),
             myBin(addr_rd, addr_width),
             myBin(we, 1),
             myBin(rst, 1),
             myBin(data_in, data_width),
             myBin(rs1, data_width),
             myBin(rs2, data_width)]
            for addr_rs1, addr_rs2, rs1, rs2 in
            zip(addr_rs1_list, addr_rs2_list, rs1_list, rs2_list)
        ]
        return read_test
        
    def create_test_string(self):
        reset_test = self.create_reset_test()
        write_test, data_in_list = self.create_write_test()
        read_test = self.create_read_test(data_in_list)

        reset_test_str = self.mat_to_str(reset_test)
        write_test_str = self.mat_to_str(write_test)
        read_test_str = self.mat_to_str(read_test)

        test = ""
        test += "\n\n// reset test\n\n"
        test += reset_test_str
        test += "\n\n// write test\n\n"
        test += write_test_str
        test += "\n\n// read test\n\n"
        test += read_test_str
        return test
    
def write_adder_cla_tb_dat_file():
    writer = adder_cla_tb_dat_writer()
    writer.create_dat_file("adder_cla.dat")
        
def write_regfile_tb_dat_file():
    writer = regfile_tb_dat_writer()
    writer.create_dat_file("banco_de_registros.dat")
        
if __name__ == "__main__":
    write_regfile_tb_dat_file()
