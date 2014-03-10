using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Runtime.Serialization;

namespace CP.TicketAllocator.Model
{
    [DataContract]
    public class ShowTime
    {
        [DataMember(Order = 1)]
        public int ShowTimeID { get; set; }
        [DataMember(Order = 2)]
        public TimeSpan ShowName { get; set; }
        [DataMember(Order = 3)]
        public string Description { get; set; }
        [DataMember(Order = 4)]
        public double Price { get; set; }
    }
}
