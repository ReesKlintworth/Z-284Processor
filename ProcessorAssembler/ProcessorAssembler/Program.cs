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

			string[] lines = File.ReadAllLines(@"C:\Users\Derek Nordgren\Documents\GitHub\284Processor\SampleAssemblyProgram.s");

			List<string> outputLines = new List<string>();

			outputLines.Add("WIDTH = 16");
			outputLines.Add("DEPTH = " + lines.Length);
			outputLines.Add("ADDRESS_RADIX = DEC;");
			outputLines.Add("DATA_RADIX = BIN;");
			outputLines.Add("\nCONTENT");
			outputLines.Add("\tBEGIN");

			Hashtable methods = new Hashtable();

			// Sets method line positions
			for (int currentLineIndex = 0; currentLineIndex < lines.Length; currentLineIndex++)
			{
				string currentLine = lines[currentLineIndex];
				if (!currentLine.StartsWith("\t"))
				{
					string methodName = currentLine.Split(':')[0];
					methods[methodName] = (Int32)currentLineIndex;

				}
			}

			for (int i = 0; i < lines.Length; i++)
			{
				string outputLine = "\t" + i + "\t:\t";

				string currentLine = lines[i];

				string[] splitByTab = currentLine.Split('\t');

				string[] components = splitByTab[1].Split(' ');

				string op = opCodes[components[0]].ToString();
				
				outputLine += op + " ";

				string[] registers = components[1].Split(',');

				int rTypeCounter = 0;
				foreach (string reg in registers)
				{
					int convertedReg = 0;
					// getting register
					if (reg.StartsWith("$"))
					{
						int register = Int32.Parse(reg[1].ToString());
						string binReg = Convert.ToString(register, 2);
						binReg = binReg.PadLeft(3, '0');
						outputLine += binReg + " ";
						rTypeCounter++;
					}
					
					// getting immediate
					else if (Int32.TryParse(reg, out convertedReg))
					{
						string immBin = Convert.ToString(convertedReg, 2);
						immBin = immBin.PadLeft(6, '0');
						outputLine += immBin + " ";
					}

					else if (reg.Contains("("))
					{
						string[] pieces = reg.Split('(');
						string iTypeImm = Convert.ToString(Int32.Parse(pieces[0]), 2);
						iTypeImm = iTypeImm.PadLeft(6, '0');
						string iTypeReg = pieces[1][1].ToString();
						iTypeReg = iTypeReg.PadLeft(3, '0');
						outputLine += iTypeReg + " ";
						outputLine += iTypeImm + " ";
					}

					else
					{
						string method = reg;
						int methodNum = Convert.ToInt32(methods[method]);
						string methodNumStr = Convert.ToString(methodNum, 2);
						methodNumStr = methodNumStr.PadLeft(6, '0');
						if (components[0] == "j")
						{
							methodNumStr = methodNumStr.PadLeft(12, '0'); 
						}
						outputLine += methodNumStr + " ";
					}
				}

				if (rTypeCounter == 3)
				{
					outputLine += aluCodes[components[0]];
				}
				outputLines.Add(outputLine);
			}

			File.WriteAllLines(@"C:\Users\Derek Nordgren\Documents\GitHub\284Processor\FirstMif.mif", outputLines.ToArray());
		}
	}
}
