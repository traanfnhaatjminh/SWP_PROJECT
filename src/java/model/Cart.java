package model;

import dal.DAO;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> list;

    public Cart() {
    }

    public Cart(List<Item> list) {
        this.list = list;
    }

    public List<Item> getList() {
        return list;
    }

    public void setList(List<Item> list) {
        this.list = list;
    }

    public ArrayList<Item> getItemsByID(int id) {
        ArrayList<Item> itemsExisted = new ArrayList<>();
        for (Item i : list) {
            if (i.getProduct().getId() == id) {
                itemsExisted.add(i);
            }
        }
        return itemsExisted;
    }

    public Item getItemByID(int id) {
        for (Item i : list) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityByID(int id) {
        return getItemByID(id).getQuantity();
    }

    public void addItem(Item i) {
        //neu da ton tai
        if (getItemByID(i.getProduct().getId()) != null) {
            Item t = getItemByID(i.getProduct().getId());
            t.setQuantity(i.getQuantity());
        } else {
            list.add(i);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            list.remove(getItemByID(id));
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item i : list) {
            total += i.getPrice() * i.getQuantity();
        }
        return total;
    }

    public Product getProductById(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> listP) {
        list = new ArrayList<>();
        DAO d = new DAO();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    if (getItemByID(id) != null) {
                        getItemByID(id).setQuantity(getQuantityByID(id) + quantity);
                    } else {
                        Product p = getProductById(id, listP);
                        Item t = new Item(p, quantity, p.getSale_price());
                        addItem(t);
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }
}
