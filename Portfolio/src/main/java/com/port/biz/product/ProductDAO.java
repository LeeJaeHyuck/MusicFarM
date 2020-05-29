package com.port.biz.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getBestProductList(){
		return mybatis.selectList("ProductDAO.getBestProductList");
	}
	
	public List<ProductVO> getNewProductList(){
		return mybatis.selectList("ProductDAO.getNewProductList");
	}
	
	public List<ProductVO> getProductList(){
		return mybatis.selectList("ProductDAO.getProductList");
	}
	
	public List<ProductVO> getProductListByKind(ProductVO vo){
		return mybatis.selectList("ProductDAO.getProductListByKind", vo);
	}
	
	public ProductVO getProduct(String pseq) {
		return mybatis.selectOne("ProductDAO.getProduct", pseq);
	}
	
	public List<ProductVO> pagingProduct(PagingVO paging){
		return mybatis.selectList("ProductDAO.pagingProduct", paging);
	}

	public int countProductList(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.countProductList", vo);
	}
	
	public List<CommentsVO> getProductComentList(int pseq){
		return mybatis.selectList("CommentDAO.getProductCommentList", pseq);
	}
	
	public void insertProductComment(CommentsVO comment) {
		mybatis.insert("CommentDAO.saveProductComment", comment);
	}
	
	public void updateComment(CommentsVO comment) {
		mybatis.update("CommentDAO.updateComment", comment);
	}
	
	public void deleteComment(int coseq) {
		mybatis.delete("CommentDAO.deleteComment", coseq);
	}
	
}