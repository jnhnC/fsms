package com.hyunjin.fsms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyunjin.fsms.controller.PaController.RsResponse;
import com.hyunjin.fsms.repository.FdMapper;
import com.hyunjin.fsms.repository.PaMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaService {
	private final PaMapper paMapper;

	public List<Map<String, Object>> fspPa002S01(Map<String, Object> map) {
		return paMapper.fspPa002S01(map);
	}

	@Transactional
	public Map<String, Object> fspPa002U01(Map<String, Object> map) {
		return paMapper.fspPa002U01(map);
	}

	public List<Map<String, Object>> fspPa003S01(Map<String, Object> map) {
		return paMapper.fspPa003S01(map);
	}

	@Transactional
	public Map<String, Object> fspPa003I01(Map<String, Object> map) {
		return paMapper.fspPa003I01(map);
	}

	@Transactional
	public Map<String, Object> savePa(Map<String, Object> map) {

		int cnt = Integer.parseInt((String)map.get("trCount"));

		List<Map<String, Object>> results = new ArrayList<>();

	    String[] statuss= (String[]) map.get("status");
	    String[] seqs= (String[]) map.get("seq");
	    String[] addQtys= (String[]) map.get("addQty");
	    String[] itemCds= (String[]) map.get("itemCd");


		for (int i = 0; i < cnt; i++) {


			String status = "";
			String seq = "";
			String addQty = "";
			String itemCd = "";



			if(statuss.length != 0) {
				status = statuss[i].equals("null") ? "" : statuss[i];
			}

			if(seqs.length != 0) {
				seq= seqs[i].equals("null") ? "" : seqs[i];
			}

			if(addQtys.length != 0) {
				addQty = addQtys[i].equals("null") ? "" : addQtys[i];
			}

			if(itemCds.length != 0) {
				itemCd = itemCds[i].equals("null") ? "" : itemCds[i];
			}

			map.put("status", status);
			map.put("seq", seq);
			map.put("addQty", addQty);
			map.put("itemCd", itemCd);

			System.out.println(map);

			//#{soNo},#{status},#{seq},#{itemCd},#{addQty},#{empNo}
			 Map<String, Object> result = paMapper.fspPa002U01(map);
			 results.add(result);

		}

		Map<String, Object> result = new HashMap<>();

		for(Map<String, Object> r : results){
			if(r.get("MSG_CD").equals("0")) {
				result.put("MSG_CD", "0");
				break;
			}else {
				result.put("MSG_CD", "1");
			}
		}

		return result;
	}


}
