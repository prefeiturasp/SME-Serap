﻿using GestaoAvaliacao.Entities;
using GestaoAvaliacao.Repository.Map.Base;

namespace GestaoAvaliacao.Repository.Map
{
    public class TestSectionStatusCorrectionMap : EntityBaseMap<TestSectionStatusCorrection>
	{
		public TestSectionStatusCorrectionMap()
		{
			ToTable("TestSectionStatusCorrection");

			HasRequired(p => p.Test)
				.WithMany()
				.HasForeignKey(p => p.Test_Id);
		}
	}
}
