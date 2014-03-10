using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using CP.TicketAllocator.DAL;
using CP.TicketAllocator.Model;

namespace CP.Tests.DALTest
{
    [TestClass]
    public class DBGatewayUnitTest
    {
        [TestMethod]
        public void ShouldGetData()
        {           
            List<Cinema> cinemaList = DBGateway.GetData(DBObjects.GetCinemas, CreateCinemaFunc);
            Assert.IsNotNull(cinemaList);
            Assert.IsTrue(cinemaList.Count > 0);
        }

        [TestMethod]
        public void ShouldGetDataWithParams()
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("@SelectedDate", DateTime.Now);
            param.Add("@CinemaID", 1);

            List<Movie> movieList = DBGateway.GetData(DBObjects.GetMovies, CreateMovieFunc, param);
            Assert.IsNotNull(movieList);
            Assert.IsTrue(movieList.Count > 0);
        }

        [TestMethod]
        public void ShouldUpdateDataWithOutParams()
        {
            Dictionary<string, object> inParam = new Dictionary<string, object>();
            inParam.Add("@MovieShowTimeID", 101);
            inParam.Add("@SelectedDate", DateTime.Now);
            inParam.Add("@Seats", 10);

            Dictionary<string, object> outParam = new Dictionary<string, object>();
            outParam.Add("@ErrorNo", 0);
            outParam.Add("@ErrorMessage", string.Empty);

            bool result = DBGateway.UpdateData(DBObjects.AllocateTickets, ref outParam, inParam);
            Assert.IsTrue(result);
            Assert.IsNotNull(outParam);
            Assert.IsTrue(Convert.ToInt32(outParam["@ErrorNo"]) == 0);
        }


        private Func<IDataReader, Movie> CreateMovieFunc = reader =>
            new Movie
            {
                MovieID = Convert.ToInt32(reader["MovieID"]),
                MovieName = Convert.ToString(reader["MovieName"]),
                Rating = Convert.ToString(reader["Rating"]),
                Poster = Convert.ToString(reader["Poster"])
            };



        private Func<IDataReader, Cinema> CreateCinemaFunc = reader =>
            new Cinema
            {

                CinemaID = Convert.ToInt16(reader["CinemaID"]),
                Capacity = Convert.ToInt16(reader["Capacity"]),
                CinemaName = Convert.ToString(reader["CinemaName"]),
                Price = Convert.ToDouble(reader["Price"])
            };
    }
}
