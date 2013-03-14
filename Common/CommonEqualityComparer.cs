using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Utility
{
    public class CommonEqualityComparer<T> : IEqualityComparer<T>
    {
        private Func<T, T, bool> r_Equal;
        private Func<T, int> r_GetHashCode;

        public CommonEqualityComparer(Func<T, T, bool> rEqual, Func<T, int> rGetHashCode)
        {
            this.r_Equal = rEqual;
            this.r_GetHashCode = rGetHashCode;
        }

        public bool Equals(T x, T y)
        {
            return r_Equal(x, y);
        }

        public int GetHashCode(T obj)
        {
            return r_GetHashCode(obj);
        }
    }
}
