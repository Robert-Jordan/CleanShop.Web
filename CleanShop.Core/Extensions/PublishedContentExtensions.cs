using Umbraco.Core.Models.PublishedContent;
using Umbraco.Web;
using Vendr.Core;
using Vendr.Core.Api;
using Vendr.Core.Models;

namespace CleanShop.Core.Extensions
{
    public static class PublishedContentExtensions
    {
        public static string GetProductReference(this IPublishedContent content)
        {
            return content.Key.ToString();
        }

        public static IProductSnapshot AsVendrProduct(this IPublishedContent content) 
        {
            return VendrApi.Instance.GetProduct(content.GetProductReference());
        }

        public static Price CalculatePrice(this IPublishedContent conent)
        {
            return conent.AsVendrProduct()?.CalculatePrice();
        }

        public static StoreReadOnly GetStore(this IPublishedContent conent)
        {
            return conent.Root().Value<StoreReadOnly>("store");
        }

        public static OrderReadOnly GetCurrentOrder(this IPublishedContent conent)
        {
            return VendrApi.Instance.GetCurrentOrder(conent.GetStore().Id);
        }
    }
}
