using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoMVC.Models
{
    public class CarritoCompraModelBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext,
           ModelBindingContext bindingContext)
        {
            //if null != bindingContext
            //obtengo sesion
            //es el key del carrito CC_123
            CarritoCompra cc = (CarritoCompra)controllerContext.HttpContext.Session["CC_123"];
            if (null == cc)
            {
                cc = new CarritoCompra();
                controllerContext.HttpContext.Session["CC_123"] = cc;
            }
            //throw new NotImplementedException();
            return cc;
        }
    }
}