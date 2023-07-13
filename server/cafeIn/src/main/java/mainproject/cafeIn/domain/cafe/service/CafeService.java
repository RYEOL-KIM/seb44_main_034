package mainproject.cafeIn.domain.cafe.service;

import lombok.RequiredArgsConstructor;
import mainproject.cafeIn.domain.cafe.dto.request.CafeInfoRequest;
import mainproject.cafeIn.domain.cafe.dto.request.SearchCafeFilterCondition;
import mainproject.cafeIn.domain.cafe.dto.response.CafeDetailResponse;
import mainproject.cafeIn.domain.cafe.dto.response.CafeResponse;
import mainproject.cafeIn.domain.cafe.entity.Cafe;
import mainproject.cafeIn.domain.cafe.repository.CafeRepository;
import mainproject.cafeIn.domain.member.service.MemberService;
import mainproject.cafeIn.domain.owner.entity.Owner;
import mainproject.cafeIn.domain.owner.service.OwnerService;
import mainproject.cafeIn.global.exception.CustomException;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static mainproject.cafeIn.global.exception.ErrorCode.*;
import static mainproject.cafeIn.global.exception.ErrorCode.CAFE_NOT_FOUND;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CafeService {
    private final CafeRepository cafeRepository;
    private final OwnerService ownerService;
    private final MemberService memberService;

    @Transactional
    public Long createCafe(Long loginId, CafeInfoRequest cafeInfoRequest, MultipartFile multipartFile) {
        Owner owner = ownerService.findVerifiedOwner(loginId);
        Cafe cafe = cafeInfoRequest.toEntity(owner);

        // TODO: 이미지 업로드, 저장

        return cafeRepository.save(cafe).getId();
    }

    @Transactional
    public void updateCafe(Long loginId, Long cafeId, CafeInfoRequest cafeInfoRequest, MultipartFile multipartFile) {
        Cafe cafe = findCafeById(cafeId);
        cafe.validateOwner(loginId);
        cafe.updateCafe(cafeInfoRequest.toEntity());

        // TODO: 이미지 수정
    }

    @Transactional
    public void deleteCafe(Long loginId, Long cafeId, String password) {
        // TODO: password 검증
        Cafe cafe = findCafeById(cafeId);
        cafe.validateOwner(loginId);
        cafeRepository.delete(cafe);
    }

    public CafeDetailResponse getCafe(Long cafeId) {
        findCafeById(cafeId);

        return cafeRepository.getCafe(cafeId);
    }

    public List<CafeResponse> searchCafesByFilterCondition(Long loginId, SearchCafeFilterCondition searchCafeFilterCondition, Pageable pageable) {

        return cafeRepository.findCafesByFilterCondition(loginId, searchCafeFilterCondition, pageable);
    }

    public List<CafeResponse> searchCafesByFilterConditionAndOrder(Long loginId, SearchCafeFilterCondition searchCafeFilterCondition, Pageable pageable, String order) {

        List<CafeResponse> result;
        if (order.equals("countBookmark")) {
            result = cafeRepository.findCafesByFilterConditionOrderByCountBookmark(loginId, searchCafeFilterCondition, pageable);
        } else if (order.equals("rating")) {
            result = cafeRepository.findCafesByFilterConditionOrderByRating(loginId, searchCafeFilterCondition, pageable);
        } else if (order.equals("countPost")) {
            result = cafeRepository.findCafesByFilterConditionOrderByCountPost(loginId, searchCafeFilterCondition, pageable);
        } else if (order.equals("createdAt")) {
            result = cafeRepository.findCafesByFilterConditionOrderByCreatedAt(loginId, searchCafeFilterCondition, pageable);
        } else throw new CustomException(REQUEST_VALIDATION_FAIL);

        return result;
    }

    public Cafe findCafeById(Long cafeId) {

        return cafeRepository.findById(cafeId)
                .orElseThrow(() -> new CustomException(CAFE_NOT_FOUND));
    }
}
