package com.hyunjin.fsms.dto;





import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString(of = {"soNo", "orderDt", "soDeptKo843"})
public class SSoHdr {

	private String soNo;
	private Date orderDt;

	private SSoDeptKo843 soDeptKo843;


	public SSoHdr(String soNo) {
		this.soNo = soNo;
	}

}
