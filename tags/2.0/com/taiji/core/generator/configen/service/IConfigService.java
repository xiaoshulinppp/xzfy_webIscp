// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   IConfigService.java

package com.taiji.core.generator.configen.service;

import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.formgen.component.RelationshipObject;

public interface IConfigService
{

	public abstract String getActionConfigure(GenerateParameter generateparameter);

	public abstract String getServiceConfigure(GenerateParameter generateparameter);

	public abstract String getHibernateConfigure(GenerateParameter generateparameter);

	public abstract void specialProcess(GenerateParameter generateparameter);

	public abstract String getActionRelationConfigure(GenerateParameter generateparameter, RelationshipObject relationshipobject);
}
