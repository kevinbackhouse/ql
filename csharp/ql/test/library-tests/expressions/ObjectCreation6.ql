/**
 * @name Test for object creations
 */

import csharp

from
  Method m, ObjectCreation e, Constructor cc, ObjectInitializer i, MemberInitializer a,
  MemberInitializer b
where
  m.hasName("MainCreations") and
  e.getEnclosingCallable() = m and
  e.getTarget() = cc and
  e.getNumberOfArguments() = 0 and
  cc.hasName("Rectangle") and
  i = e.getInitializer() and
  a = i.getMemberInitializer(0) and
  a.getLValue().(PropertyAccess).getTarget().hasName("P1") and
  a.getRValue() instanceof ObjectCreation and
  b = i.getMemberInitializer(1) and
  b.getLValue().(PropertyAccess).getTarget().hasName("P2") and
  b.getRValue() instanceof ObjectCreation and
  i.getNumberOfMemberInitializers() = 2
select i, a, b
