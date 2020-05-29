package com.port.biz.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;
	
	@Override
	public List<ProductVO> getBestProductList() {
		return dao.getBestProductList();
	}

	@Override
	public List<ProductVO> getNewProductList() {
		return dao.getNewProductList();
	}

	@Override
	public List<ProductVO> getProductList() {
		return dao.getProductList();
	}

	@Override
	public List<ProductVO> getProductListByKind(ProductVO vo) {
		return dao.getProductListByKind(vo);
	}

	@Override
	public ProductVO getProduct(String pseq) {
		return dao.getProduct(pseq);
	}

	@Override
	public List<ProductVO> pagingProduct(PagingVO paging) {
		return dao.pagingProduct(paging);
	}

	@Override
	public int countProductList(ProductVO vo) {
		return dao.countProductList(vo);
	}

	@Override
	public List<CommentsVO> getProductCommentList(int pseq) {
		return dao.getProductComentList(pseq);
	}

	@Override
	public void insertProductComment(CommentsVO comment) {
		dao.insertProductComment(comment);
	}

	@Override
	public void updateComment(CommentsVO comment) {
		dao.updateComment(comment);
	}

	@Override
	public void deleteComment(int coseq) {
		dao.deleteComment(coseq);
	}

}
