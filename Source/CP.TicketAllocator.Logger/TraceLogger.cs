using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CP.TicketAllocator.Logger
{
    public static class TraceLogger
    {
        private static log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static log4net.ILog Logger
        {
            get
            {
                return log;
            }
        }

        public static void LogTrace(LogType logType, string message, params object[] args)
        {
            try
            {
                switch (logType)
                {
                    case LogType.Debug:
                        log.DebugFormat(message, args);
                        break;
                    case LogType.Error:
                        log.ErrorFormat(message, args);
                        break;
                    case LogType.Fatal:
                        log.FatalFormat(message, args);
                        break;
                    case LogType.Info:
                        log.InfoFormat(message, args);
                        break;
                    case LogType.Warn:
                        log.WarnFormat(message, args);
                        break;
                }
            }
            catch (Exception e)
            {
                log.WarnFormat(e.Message);
            }
        }
    }
}
