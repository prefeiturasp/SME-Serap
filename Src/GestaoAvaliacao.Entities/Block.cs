﻿using GestaoAvaliacao.Entities.Base;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace GestaoAvaliacao.Entities
{
    public class Block : EntityBase
    {
        public Block()
        {
            BlockItems = new List<BlockItem>();
            BlockChainBlocks = new List<BlockChainBlock>();
            Blocos = new List<BlockChain>();
        }

        public string Description { get; set; }
        public virtual Booklet Booklet { get; set; }
        public long? Booklet_Id { get; set; }
        public virtual Test Test { get; set; }
        public long? Test_Id { get; set; }
        public virtual List<BlockItem> BlockItems { get; set; }
        public virtual List<BlockKnowledgeArea> BlockKnowledgeAreas { get; set; }
        public virtual List<BlockChainBlock> BlockChainBlocks { get; set; }

        [NotMapped]
        public virtual List<BlockChain> Blocos { get; set; }
    }
}
