using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WSI.Model.Entities
{
    public class Attachment_Media : Attachment
    {
        /// <summary>
        /// 长度，单位为秒
        /// </summary>
        public Decimal Duration { get; set; }
    }
}
