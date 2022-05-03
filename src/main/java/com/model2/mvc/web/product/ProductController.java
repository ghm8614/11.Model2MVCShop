package com.model2.mvc.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// C
	public ProductController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product) throws Exception {

		// Service 에서 처리
		// product.setManuDate(product.getManuDate().replace("-", ""));

		productService.insertProduct(product);

		// 등록한 상품의 정보를 addProductView.jsp에 띄우기 위해서 Model객체(requestScope)를 사용한다
		// --> forward 사용 (redirect 사용시 Model에 담은 data 모두 사라짐)
		return "forward:/product/addProductView.jsp";
	}

	// method = get : left.jsp에서 판매상품관리, 상품검색
	// method = post : 페이징, 검색
	// get, post 방식 모두 받으려면, method = get/post 명시하지 않기 (서블릿의 doGet(), doPost() 모두 받는
	// service()? )
	@RequestMapping(value = "/listProduct")
	public String listProduct(@ModelAttribute("search") Search search,
			@RequestParam(value = "menu", required = false) String menu, Model model) throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// ProductServiceTest 참고 (totalCount, list)
		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("totalCount"), pageUnit, pageSize);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("menu", menu);

		return "forward:/product/listProduct.jsp";
	}

	@RequestMapping(value = "/getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		System.out.println("prodNo :" + prodNo);

		Product product = productService.findProduct(prodNo);
		model.addAttribute("product", product);

		return "forward:/product/readProduct.jsp";
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		Product product = productService.findProduct(prodNo);
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(@RequestParam("prodNo") String prodNo, @ModelAttribute("product") Product product)
			throws Exception {

		productService.updateProduct(product);

		return "redirect:/product/getProduct?prodNo=" + prodNo;
	}
}
