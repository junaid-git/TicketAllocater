using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CP.TicketAllocator.Model
{
    public class ShowTime
    {
        public byte ShowTimeID { get; set; }
        public TimeSpan ShowName { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
    }
}
