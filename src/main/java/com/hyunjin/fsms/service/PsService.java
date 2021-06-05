package com.hyunjin.fsms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyunjin.fsms.repository.PsMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PsService {

	final private PsMapper psMapper;


	public List<Map<String, Object>> fspPs001S01(Map<String, Object> map) {
		return psMapper.fspPs001S01(map);
	}

	public Map<String, Object> fspPs002S01(Map<String, Object> map) {
		return psMapper.fspPs002S01(map);
	}

	public List<Map<String, Object>> fspPs002S02(Map<String, Object> map) {
		return psMapper.fspPs002S02(map);
	}

	public List<Map<String, Object>> fspPs002S04(Map<String, Object> map) {
		return psMapper.fspPs002S04(map);
	}

	public List<Map<String, Object>> fspPs002S05(Map<String, Object> map) {
		return psMapper.fspPs002S05(map);
	}

	public List<Map<String, Object>> fspPs002S06(Map<String, Object> map) {
		return psMapper.fspPs002S06(map);
	}

	public List<Map<String, Object>> fspPs002S07(Map<String, Object> map) {
		return psMapper.fspPs002S07(map);
	}

	public List<Map<String, Object>> fspPs002S08(Map<String, Object> map) {
		return psMapper.fspPs002S08(map);
	}

	public Map<String, Object> fspPs002S09(Map<String, Object> map) {
		return psMapper.fspPs002S09(map);
	}


	@Transactional
	public Map<String, Object> savePs(Map<String, Object> map) {
		List<Map<String, Object>> allBMinors = psMapper.fspPs002S08(map);
		List<String> adSupCds = new ArrayList<>();

		for (int i = 0; i < allBMinors.size(); i++) {
			if(String.valueOf(map.get("bMinors")).contains(String.valueOf(allBMinors.get(i).get("NAME")))) {
				adSupCds.add(String.valueOf(allBMinors.get(i).get("CODE")));
			}
		}

		//#{soNo}
		Map<String, Object> bMinorDelete = psMapper.fspPs002D01(map);
		for (String adSupCd : adSupCds) {
			map.put("adSupCd", adSupCd);
			//(#{soNo},#{adSupCd},#{empNo}
			Map<String, Object> bMinorInsert = psMapper.fspPs002I01(map);
		}

		//#{soNo},#{adMemo},#{adSign},#{adType},#{adPackItem},#{adChItem},#{empNo},#{infoAgreeYn}
		Map<String,Object> result = psMapper.fspPs002U01(map);

		return result;

	}







}
