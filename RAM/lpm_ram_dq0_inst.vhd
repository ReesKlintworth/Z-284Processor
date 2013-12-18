lpm_ram_dq0_inst : lpm_ram_dq0 PORT MAP (
		address	 => address_sig,
		data	 => data_sig,
		inclock	 => inclock_sig,
		we	 => we_sig,
		q	 => q_sig
	);
