package dto;

import java.sql.Date;
import java.util.ArrayList;

public class Expenditure {
    int expend_id;
    int amount;
    Date expend_date;
    String img;
    String category;
    String description;
    ArrayList<String> tag;

    public Expenditure() {
    }

    public Expenditure(int expend_id, int amount, Date expend_date, String img,
                       String category, String description, String tag) {
        this.expend_id = expend_id;
        this.amount = amount;
        this.expend_date = expend_date;
        this.img = img;
        this.category = category;
        this.description = description;
        this.tag = toArrayList(tag);
    }

    private ArrayList<String> toArrayList(String tag) {
        ArrayList<String> tagList = new ArrayList<String>();
        //문자열 split

        return tagList;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getExpend_date() {
        return expend_date;
    }

    public void setExpend_date(Date expend_date) {
        this.expend_date = expend_date;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTag() {
        return tag.toString();
    }

    public void setTag(ArrayList<String> tag) {
        this.tag = tag;
    }


    public int getExpend_id() {
        return expend_id;
    }

    public void setExpend_id(int expend_id) {
        this.expend_id = expend_id;
    }
}