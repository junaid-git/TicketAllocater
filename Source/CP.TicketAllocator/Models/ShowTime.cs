using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CP.TicketAllocator.Models
{
    public class ShowTime : BaseModel
    {
        public byte ShowTimeID { get; set; }
        public TimeSpan ShowName { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
    }
}
