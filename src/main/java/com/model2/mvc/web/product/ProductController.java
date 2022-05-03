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

		// Service ���� ó��
		// product.setManuDate(product.getManuDate().replace("-", ""));

		productService.insertProduct(product);

		// ����� ��ǰ�� ������ addProductView.jsp�� ���� ���ؼ� Model��ü(requestScope)�� ����Ѵ�
		// --> forward ��� (redirect ���� Model�� ���� data ��� �����)
		return "forward:/product/addProductView.jsp";
	}

	// method = get : left.jsp���� �ǸŻ�ǰ����, ��ǰ�˻�
	// method = post : ����¡, �˻�
	// get, post ��� ��� ��������, method = get/post ������� �ʱ� (������ doGet(), doPost() ��� �޴�
	// service()? )
	@RequestMapping(value = "/listProduct")
	public String listProduct(@ModelAttribute("search") Search search,
			@RequestParam(value = "menu", required = false) String menu, Model model) throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// ProductServiceTest ���� (totalCount, list)
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
