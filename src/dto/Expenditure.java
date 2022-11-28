package dto;

import java.sql.Date;
import java.util.ArrayList;

public class Expenditure {
    private int expend_id;
    private int amount;
    private Date expend_date;
    private String img;
    private String category;
    private String description;
    private ArrayList<String> tagList = new ArrayList<String>();

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
        toArrayList(tag);
    }

    public void toArrayList(String tag) {
        ArrayList<String> tl = new ArrayList<String>();
        //문자열 split
        int begin = 1, dest = tag.length() - 1;
        tag = tag.substring(begin, dest); // '[', ']' 문자 제거
        String[] tagStr = tag.split("#"); // 해시태그 분리

        for (String s : tagStr) {
            if(!s.isEmpty()) {
                int last = s.length() - 1;
                String sub = s.substring(last-1, last+1);
                /*
                System.out.println("문자열: " + s + "| 길이: " + s.length() + "| 인덱스:" + last);
                for(char c : s.toCharArray())
                    System.out.print(c + "|");
                System.out.println();
                System.out.println("부분문자: " + sub + "|");
                */
                if (sub.equals(", ")) {
                    s = s.substring(0, last-1);
                }
                if (!tagList.contains(s))
                    tagList.add(s);
            }
        }
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

    public String getTagString() {
        return tagList.toString();
    }

    public ArrayList<String> getTagArray() {
        return tagList;
    }

    public void setTagList(ArrayList<String> tagList) {
        this.tagList = tagList;
    }


    public int getExpend_id() {
        return expend_id;
    }

    public void setExpend_id(int expend_id) {
        this.expend_id = expend_id;
    }
}