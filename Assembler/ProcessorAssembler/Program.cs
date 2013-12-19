using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;

// TODO check that arguments are correct for all operations

namespace ProcessorAssembler
{
	class Program
	{
		public static bool lengthMoreThan256 = false;

		static void Main(string[] args)
		{
			#region hashtables
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

			var numOfRegistersPerOperationTable = new Hashtable();
			numOfRegistersPerOperationTable["and"] = 3;
			numOfRegistersPerOperationTable["add"] = 3;
			numOfRegistersPerOperationTable["xor"] = 3;
			numOfRegistersPerOperationTable["or"] = 3;
			numOfRegistersPerOperationTable["slt"] = 3;
			numOfRegistersPerOperationTable["sub"] = 3;
			numOfRegistersPerOperationTable["sll"] = 3;
			numOfRegistersPerOperationTable["srl"] = 3;
			numOfRegistersPerOperationTable["addiu"] = 2;
			numOfRegistersPerOperationTable["subiu"] = 2;
			numOfRegistersPerOperationTable["addi"] = 2;
			numOfRegistersPerOperationTable["subi"] = 2;
			numOfRegistersPerOperationTable["j"] = 0;
			numOfRegistersPerOperationTable["jr"] = 1;
			numOfRegistersPerOperationTable["jal"] = 0;
			numOfRegistersPerOperationTable["beq"] = 2;
			numOfRegistersPerOperationTable["bne"] = 2;
			numOfRegistersPerOperationTable["lw"] = 2;
			numOfRegistersPerOperationTable["sw"] = 2;

			var numOfImmPerOperationTable = new Hashtable();
			numOfImmPerOperationTable["and"] = 0;
			numOfImmPerOperationTable["add"] = 0;
			numOfImmPerOperationTable["xor"] = 0;
			numOfImmPerOperationTable["or"] = 0;
			numOfImmPerOperationTable["slt"] = 0;
			numOfImmPerOperationTable["sub"] = 0;
			numOfImmPerOperationTable["sll"] = 0;
			numOfImmPerOperationTable["srl"] = 0;
			numOfImmPerOperationTable["addiu"] = 1;
			numOfImmPerOperationTable["subiu"] = 1;
			numOfImmPerOperationTable["addi"] = 1;
			numOfImmPerOperationTable["subi"] = 1;
			numOfImmPerOperationTable["j"] = 1;
			numOfImmPerOperationTable["jr"] = 0;
			numOfImmPerOperationTable["jal"] = 1;
			numOfImmPerOperationTable["beq"] = 1;
			numOfImmPerOperationTable["bne"] = 1;
			numOfImmPerOperationTable["lw"] = 1;
			numOfImmPerOperationTable["sw"] = 1;

			#endregion

			Console.WriteLine("Specify input .s file.");
			string filename = Console.ReadLine();

			if (!filename.EndsWith(".s"))
			{
				Console.WriteLine("Whoops! Selected file is not .s. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			try
			{
				string[] lines = File.ReadAllLines(filename);


				List<string> outputLines = new List<string>();

				outputLines.Add("WIDTH = 16;");
				outputLines.Add("DEPTH = 256;");
				outputLines.Add("ADDRESS_RADIX = DEC;");
				outputLines.Add("DATA_RADIX = BIN;");
				outputLines.Add("\nCONTENT");
				outputLines.Add("\tBEGIN");
				outputLines.Add("\t[0..255]\t:\t0000000000000000;");

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
					if (!(i < 256))
					{
						// do we want to just run the loop for 256?
						// or should it just break and set a flag?
						lengthMoreThan256 = true;
						break;
					}
					string outputLine = "\t" + i + "\t\t\t:\t";

					string currentLine = lines[i];

					string[] splitByTab = currentLine.Split('\t');

					string[] components = splitByTab[1].Split(' ');

					string op = opCodes[components[0]].ToString();

					outputLine += op;

					string[] registers = components[1].Split(',');

					int rTypeCounter = 0;
					int regCounter = 0;
					int immCounter = 0;
					int totalArgs = 0;

					foreach (string reg in registers)
					{
						#region parse arguments
						int convertedReg = 0;
						// getting register
						if (reg.StartsWith("$"))
						{
							int register = Int32.Parse(reg[1].ToString());
							// 3 bit registers only
							if (register > 7)
							{
								throw new InvalidOperationException();
							}
							string binReg = Convert.ToString(register, 2);
							binReg = binReg.PadLeft(3, '0');
							outputLine += binReg;
							rTypeCounter++;

							regCounter++;
							totalArgs++;
						}

						// getting immediate
						else if (Int32.TryParse(reg, out convertedReg))
						{
							string immBin = Convert.ToString(convertedReg, 2);
							immBin = immBin.PadLeft(6, '0');
							if (immBin.Length > 6)
							{
								throw new FormatException();
							}
							outputLine += immBin;
							totalArgs++;
							immCounter++;
						}

						else if (reg.Contains("("))
						{
							string[] pieces = reg.Split('(');
							string iTypeImm = Convert.ToString(Int32.Parse(pieces[0]), 2);
							iTypeImm = iTypeImm.PadLeft(6, '0');
							if (iTypeImm.Length > 6)
							{
								throw new FormatException();
							}
							string iTypeReg = pieces[1][1].ToString();
							iTypeReg = iTypeReg.PadLeft(3, '0');
							outputLine += iTypeReg;
							outputLine += iTypeImm;
							totalArgs += 2;
							immCounter++;
							regCounter++;
						}

						else
						{
							string method = reg;
							int methodNum = Convert.ToInt32(methods[method]);
							string methodNumStr = Convert.ToString(methodNum, 2);
							methodNumStr = methodNumStr.PadLeft(6, '0');
							if (components[0] == "j")
							{
								if (methodNumStr.Length > 6)
								{
									throw new FormatException();
								}
								methodNumStr = methodNumStr.PadLeft(12, '0');
							}
							else
							{
								if (methodNumStr.Length > 6)
								{
									throw new FormatException();
								}
							}
							outputLine += methodNumStr;
							totalArgs++;
							immCounter++;
						}
						#endregion
					}

					if (rTypeCounter == 3)
					{
						outputLine += aluCodes[components[0]];
					}
					string rd = outputLine.Substring(outputLine.Length - 12, 3);

					if (!(totalArgs == ((int)numOfImmPerOperationTable[components[0]] + (int)numOfRegistersPerOperationTable[components[0]])))
					{
						throw new FormatException();
					}

					if (!(immCounter == ((int)numOfImmPerOperationTable[components[0]])))
					{
						throw new FormatException();
					}

					if (!(regCounter == ((int)numOfRegistersPerOperationTable[components[0]])))
					{
						throw new FormatException();
					}

					if (rd.Equals("000") && (!(((int)numOfRegistersPerOperationTable[components[0]] == 0) || op.Equals("1000") || op.Equals("1001"))))
					{
						throw new EntryPointNotFoundException();
					}
					outputLine += ";";

					// jump reg
					if (op.Equals("0110"))
					{
						outputLine = outputLine.Insert(outputLine.Length - 4, "000");
						outputLine = outputLine.Insert(outputLine.Length - 1, "000000");
					}

					outputLines.Add(outputLine);
				}
				outputLines.Add("END;");

				if (lengthMoreThan256)
				{
					// do something here
					Console.WriteLine("File has more than 256 instructions. Only first 256 assembled.");
				}

				Console.WriteLine("Assembly successful. Specify output location.");
				string outputFilename = Console.ReadLine();

				File.WriteAllLines(outputFilename, outputLines.ToArray());
				Console.WriteLine("Output file written successfully. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			#region exceptions
			catch (FormatException)
			{
				Console.WriteLine("Syntax error. Please check your assembly file. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (EntryPointNotFoundException)
			{
				Console.WriteLine("You are not allowed to modify the 0 register. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (FileNotFoundException)
			{
				Console.WriteLine("File not found. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (NullReferenceException)
			{
				Console.WriteLine("File not formatted correctly. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (IndexOutOfRangeException)
			{
				Console.WriteLine("File not formatted correctly. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (InvalidOperationException)
			{
				Console.WriteLine("Error: You may only use registers 0 - 7. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			catch (Exception)
			{
				Console.WriteLine("Output file not able to be written. Press Return to exit.");
				Console.ReadLine();
				return;
			}
			#endregion
		}
	}
}
