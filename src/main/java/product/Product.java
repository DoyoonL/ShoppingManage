package product;

public class Product {
        private String prdid; // 제품 식별고유번호
        private String brand;
        private String category; // 만년필, 잉크, 다이어리&노트, 지갑, 벨트, 향수, 잡화(키홀더..)
        private String name;
        private int price; 
        private String origin; // 원산지
        
		public String getPrdid() {
			return prdid;
		}
		public void setPrdid(String prdid) {
			this.prdid = prdid;
		}
		public String getBrand() {
			return brand;
		}
		public void setBrand(String brand) {
			this.brand = brand;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getOrigin() {
			return origin;
		}
		public void setOrigin(String origin) {
			this.origin = origin;
		}
		
       
      
               
}
