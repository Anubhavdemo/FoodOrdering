using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodOrdering.Model
{
    public class Class1
    {
    }

    [Serializable]
    public class Product
    {
        int pid;
        String pname;
        int qty;
        String type;
        int price;
        int total;
        String img;

        public Product()
        { }

        public Product(int pid, String pname, int qty, int price, String img,string type)
        {
            this.img = img;
            this.pid = pid;
            this.pname = pname;
            this.qty = qty;
            this.price = price;
            this.total = price * qty;
            this.type = type;
        }

        public int Pid
        {
            get
            {
                return pid;
            }
            set
            {
                pid = value;
            }
        }

        public string Pname
        {
            get
            {
                return pname;
            }
            set
            {
                pname = value;
            }
        }

        public string Img
        {
            get
            {
                return img;
            }
            set
            {
                img = value;
            }
        }

        public int Qty
        {
            get
            {
                return qty;
            }
            set
            {
                qty = value;
            }
        }

        public int Price
        {
            get
            {
                return price;
            }
            set
            {
                price = value;
            }
        }

        public int Total
        {
            get
            {
                return total;
            }
            set
            {
                total = value;
            }
        }

        public string Type { get {return type; } set { type = value; } }

    }

    [Serializable]
    public class ProductList
    {
        List<Product> prodlist;

        public ProductList()
        {
            prodlist = new List<Product>();
        }

        public ProductList(List<Product> prodlist)
        {
            this.prodlist = prodlist;
        }

        public List<Product> addProduct(Product p)
        {
            removeProduct(p.Pid);
            prodlist.Add(p);
            return prodlist;
        }

        public List<Product> GetProduct(Object prodlist)
        {
            this.prodlist = (List<Product>)prodlist;
            return this.prodlist;
        }

        public List<Product> removeProduct(int pid)
        {
            for (int i = 0; i < prodlist.Count; i++)
            {
                if (prodlist[i].Pid == pid)
                {
                    prodlist.RemoveAt(i);
                }
            }
            return prodlist;
        }

    }
}