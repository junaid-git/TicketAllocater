using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CP.TicketAllocator.Model
{
    public class Cinema
    {
        public short CinemaID { get; set; }
        public string CinemaName { get; set; }
        public short Capacity { get; set; }
        public double Price { get; set; }
    }
}
