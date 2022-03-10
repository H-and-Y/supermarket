package save;

public class Goods {
    String goods_id = "";
    String goods_name = "";
    float goods_price = 0;
    String goods_made = "";
    String goods_pic = "";
    String goods_mess = "";
    int classNumber = 0;
    int inventory = 0;
    String backNews = "";
    /*商品标识号 goods_id      商品名称 goods_name     价格 goods_price
    制造商 goods_made         图片 goods_pic     商品介绍 goods_mess
    所属类别 classNumber       库存 inventory     反馈 backNews*/
    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public float getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(float goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_made() {
        return goods_made;
    }

    public void setGoods_made(String goods_made) {
        this.goods_made = goods_made;
    }

    public String getGoods_pic() {
        return goods_pic;
    }

    public void setGoods_pic(String goods_pic) {
        this.goods_pic = goods_pic;
    }

    public String getGoods_mess() {
        return goods_mess;
    }

    public void setGoods_mess(String goods_mess) {
        this.goods_mess = goods_mess;
    }

    public int getClassNumber() {
        return classNumber;
    }

    public void setClassNumber(int classNumber) {
        this.classNumber = classNumber;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }
}
