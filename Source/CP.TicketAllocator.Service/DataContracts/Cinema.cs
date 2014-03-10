using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace CP.TicketAllocator.Model
{
    [DataContract]
    public class Cinema
    {
        [DataMember(Order=1)]
        public short CinemaID { get; set; }
        [DataMember(Order = 2)]
        public string CinemaName { get; set; }
        [DataMember(Order = 3)]
        public short Capacity { get; set; }
        [DataMember(Order = 4)]
        public double Price { get; set; }
    }
}
