using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace ProcessorAssembler
{
	class Program
	{
		static void Main(string[] args)
		{
			Hashtable opCodes = new Hashtable();
			opCodes["and"] = "0000";
			opCodes["add"] = "0000";
			opCodes["xor"] = "0000";
			opCodes["or"] = "0000";
			opCodes["slt"] = "0000";
			opCodes["sub"] = "0000";
			opCodes["sll"] = "0000";
			opCodes["srl"] = "0000";
			opCodes["addiu"] = "0001";
			opCodes["subiu"] = "0010";
			opCodes["addi"] = "0011";
			opCodes["subi"] = "0100";
			opCodes["j"] = "0101";
			opCodes["jr"] = "0110";
			opCodes["jal"] = "0111";
			opCodes["beq"] = "1000";
			opCodes["bne"] = "1001";
			opCodes["lw"] = "1010";
			opCodes["sw"] = "1011";

			Hashtable aluCodes = new Hashtable();
			aluCodes["and"] = "000";
			aluCodes["add"] = "001";
			aluCodes["xor"] = "010";
			aluCodes["or"] = "011";
			aluCodes["slt"] = "100";
			aluCodes["sub"] = "101";
			aluCodes["sll"] = "110";
			aluCodes["srl"] = "111";

			string[] lines = File.ReadAllLines(@"C:\Repos\284Processor\SampleAssemblyProgram.s");

			List<string> outputLines = new List<string>();

			outputLines.Add("WIDTH = 16");
			outputLines.Add("DEPTH = " + lines.Length);
			outputLines.Add("ADDRESS_RADIX = DEC;");
			outputLines.Add("DATA_RADIX = BIN;");
			outputLines.Add("\nCONTENT");
			outputLines.Add("\tBEGIN");

			for (int i = 0; i < lines.Length; i++)
			{
				string line = "\t" + i + "\t:\t";
				string[] components = lines[i].Split(' ');
				line += opCodes[components[0]].ToString();
			}

			File.WriteAllLines(@"C:\Repos\284Processor\FirstMif.mif", outputLines.ToArray());
		}
	}
}
