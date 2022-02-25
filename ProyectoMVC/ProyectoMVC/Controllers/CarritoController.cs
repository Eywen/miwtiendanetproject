using ProyectoMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoMVC.Controllers
{
    //[Authorize(Users ="pepe", Roles ="admin")]  validaciones de control de acceso
    [Authorize] // redirecciona al login si el usuario no esta logueado, por lo tanto no puede hacer un pedido


    public class CarritoController : Controller
    {
        ModeloTiendaContainer con = new ModeloTiendaContainer();
        // GET: Carrito. listar todos los productos del carrito
        public ActionResult Index(CarritoCompra cc)
        {
            return View(cc);
        }

        public ActionResult Add(CarritoCompra cc, int id)
        {
            ModeloTiendaContainer con = new ModeloTiendaContainer();
            Producto p = con.Productos.Find(id); //NOTA:  hay q buscarlo asi, este es el de bbdd y el que viene pq p del forech viene es de la sesion en el carrito
            cc.Add(p);
            return RedirectToAction("Index", "Productos");
            //return View();
        }

        public ActionResult Confirm(CarritoCompra cc)
        {
            Pedido pedido = new Pedido();
            foreach (Producto p in cc)
            {
                ProductoComprado pc = new ProductoComprado();
                pc.Producto = con.Productos.Find(p.Id);
                pedido.ProductoComprado.Add(pc);
            }
            con.Pedidos.Add(pedido);
            Cliente cliente = con.Clientes.Where(x => x.Email.Equals(User.Identity.Name)).FirstOrDefault();
            pedido.Cliente = cliente;

            con.SaveChanges();
            cc.Clear();
            return RedirectToAction("Index", "Productos");
        }
    }
}