#include <iostream>
#include <sstream>
#include <fstream>
#include <cstdio>
#include <map>
#include <vector>
#include <cstring>
#include <string>
#include <cstdlib>
using namespace std;

void assert(bool should, string msg, int line_num) {
  if (!should) {
    cout << "error in line" << line_num << " : " << msg << endl;
    exit(-1);
  }
}
string preprocess(string input) {
  for (int i = 0; i < input.length(); i++) {
    if (input[i] == ',') {
      input[i] = ' ';
    }
  }
  return input;
}

string ten2bin(string input, int output_length, int line_num, bool must_postive) {
  string output;
  int i;
  if (must_postive) {
    i = 0;
  } else {
    if (input[0] == '-') i = 1;
  }
  for (; i < input.length(); i++) {
    assert(input[i] >= '0' && input[i] <= '9', "the number error", line_num);
  }
  int num = atoi(input.c_str());
  int mask = 1;
  for (i = output_length-1; i >= 0; i--) {
    output += char( (((mask << i) & num) >> i) + '0');
  }
  return output;
}
string hex2bin(string input, int output_length, int line_num) {
  string output;
  assert(input.length() == 10, "the hex number should be length of 10", line_num);
  assert(input[0] == '0' && (input[1] == 'x' || input[1] == 'X'),
         "the hex number should begin with 0x or 0X", line_num);
  int num;
  sscanf(&(input.c_str()[2]), "%x", &num);
  int mask = 1;
  for (int i = output_length-1; i >= 0; i--) {
    output += char( (((mask << i) & num) >> i) + '0');
  }
  return output;
}
string R_instruction(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string reserved = "00000000000"; // 11 bits
  string rs,rt,rd;
  if (op == "add") output += "000000";
  if (op == "sub") output += "000001";
  if (op == "or" ) output += "010000";
  if (op == "and") output += "010001";
  if (op == "slt") output += "100111";
  ss >> rd >> rs >> rt;
  assert(rs[0]=='$', "the register should begin with $", line_num);
  assert(rt[0]=='$', "the register should begin with $", line_num);
  assert(rd[0]=='$', "the register should begin with $", line_num);
  output += ten2bin(rs.substr(1, rs.length()-1), 5, line_num, true);
  output += ten2bin(rt.substr(1, rt.length()-1), 5, line_num, true);
  output += ten2bin(rd.substr(1, rd.length()-1), 5, line_num, true);
  output += reserved;
  return output;
}
string I_instruction1(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string rs,rt,immediate;
  if (op == "addi") {
    output += "000010";
    ss >> rt >> rs >> immediate;
  } 
  if (op == "ori" ){
   output += "010010";
   ss >> rt >> rs >> immediate;   
  }
  if (op == "beq") {
    output += "110100";
    ss >> rs >> rt >> immediate;
  }
  assert(rs[0]=='$', "the register should begin with $", line_num);
  assert(rt[0]=='$', "the register should begin with $", line_num);
  output += ten2bin(rs.substr(1, rs.length()-1), 5, line_num, true);
  output += ten2bin(rt.substr(1, rt.length()-1), 5, line_num, true);
  output += ten2bin(immediate, 16, line_num, false);
  return output;
}
string I_instruction2(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string rs,rt,immediate;
  if (op == "sw" ) output += "110000";
  if (op == "lw" ) output += "110001";
  ss >> rt;
  string tem;
  ss >> tem;
  bool left_flag = false, right_flag = false;
  for (int i = 0; i < tem.length(); i++) {
    if (tem[i] >= '0' && tem[i] <= '9') {
      immediate += tem[i];
      continue;
    }
    if (tem[i] == '(') {
      assert(left_flag == false, "the ( should only have one", line_num);
      left_flag = true;
      continue;
    }
    if (tem[i] == ')') {
      right_flag = true;
      assert(i == tem.length()-1, "the ) should be the end of that line", line_num);
      continue;
    }
    if (left_flag) {
      rs += tem[i];
      continue;
    }
  }
  assert(left_flag && right_flag, "the () must exist and match", line_num);
  assert(rs[0]=='$', "the register should begin with $", line_num);
  assert(rt[0]=='$', "the register should begin with $", line_num);
  output += ten2bin(rs.substr(1, rs.length()-1), 5, line_num, true);
  output += ten2bin(rt.substr(1, rt.length()-1), 5, line_num, true);
  output += ten2bin(immediate, 16, line_num, false);
  return output;
}
string sll_instruction(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string reserved = "000000"; // 6 bits
  string rd,rt,sa;
  output += "011000";
  ss >> rd >> rt >> sa;
  assert(rd[0]=='$', "the register should begin with $", line_num);
  assert(rt[0]=='$', "the register should begin with $", line_num);
  output += "00000";
  output += ten2bin(rt.substr(1, rt.length()-1), 5, line_num, true);
  output += ten2bin(rd.substr(1, rd.length()-1), 5, line_num, true);
  output += ten2bin(sa, 5, line_num, true);
  output += reserved;
  return output;
}
string move_instruction(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string reserved = "00000000000"; // 11 bits
  string rs,rd;
  output += "100000";
  ss >> rd >> rs;
  assert(rs[0]=='$', "the register should begin with $", line_num);
  assert(rd[0]=='$', "the register should begin with $", line_num);
  output += ten2bin(rs.substr(1, rs.length()-1), 5, line_num, true);
  output += "00000";
  output += ten2bin(rd.substr(1, rd.length()-1), 5, line_num, true);
  output += reserved;
  return output;
}
string jr_instruction(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string reserved = "00000000000"; // 11 bits
  string rs;
  output += "111001";
  ss >> rs;
  assert(rs[0]=='$', "the register should begin with $", line_num);
  output += ten2bin(rs.substr(1, rs.length()-1), 5, line_num, true);
  output += "00000";
  output += "00000";
  output += reserved;
  return output;
}
string jump_instruction(string input, int line_num) {
  input = preprocess(input);
  stringstream ss(input);
  string op, output;
  ss >> op;
  string rs, address;
  if (op == "j"  ) output += "111000";
  if (op == "jal") output += "111010";
  ss >> address;
  output += hex2bin(address, 26, line_num);
  return output;
}
string code_generate(string input, int line_num) {
  stringstream ss(input);
  string output;
  string op;
  ss >> op;
  if (op == "halt") {
    output += "111111";
    for (int i = 0; i < 26; i++) output += "0";
  }
  if (op == "add" || op == "sub" || op == "or" || op == "and" ||
      op == "slt") {
    output += R_instruction(input, line_num);
  }
  if (op == "addi" || op == "ori"  || op == "beq") {
    output += I_instruction1(input, line_num);
  }
  if (op == "sw" || op == "lw") {
    output += I_instruction2(input, line_num);
  }
  if (op == "sll") {
    output += sll_instruction(input, line_num);
  }
  if (op == "move") {
    output += move_instruction(input, line_num);
  }
  if (op == "jr") {
    output += jr_instruction(input, line_num);
  }
  if (op == "j" || op == "jal") {
    output += jump_instruction(input, line_num);
  }
  if (output.length() == 32) output += "\n";
  return output;
}

int main(int argc, char** argv) {
  ifstream in;
  in.open("input.asm");
  if (!in.is_open()) {
    cout << "the input file path is incorrect" << endl;
  }
  ofstream out;
  out.open("output.bin");
  string line;
  int line_num = 0;
  while (getline(in, line)) {
    line_num++;
    out << code_generate(line, line_num); // need not endl
  }
}