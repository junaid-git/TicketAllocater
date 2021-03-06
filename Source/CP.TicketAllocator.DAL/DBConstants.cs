﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CP.TicketAllocator.DAL
{
    public class DBObjects
    {
        public const string GetCinemas = "dbo.uspGetCinemas";
        public const string GetMovies = "dbo.uspGetMovies";
        public const string GetShowTime = "dbo.uspGetMovieShowTime";        
        public const string GetAvailableSeats = "dbo.uspGetAvailableSeats";
        public const string AllocateTickets = "dbo.uspAllocateTickets";
    }

    public class SPInputParam
    {
        public Type Type;
        public object Value;
    }

    internal class Configuration
    {
        //public const string TicketAllocatorConnection = "TicketAllocator.ConnectionString";
        public const string DataProvider = "DataProvider";
        public const string ConnectionStringName = "ConnectionStringName";
    }
}
