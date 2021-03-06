// This is a generated file. Not intended for manual editing.
package org.rust.lang.core.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface RustForeignItem extends RustCompositeElement {

  @Nullable
  RustAbi getAbi();

  @NotNull
  List<RustAnonParam> getAnonParamList();

  @NotNull
  List<RustAnonParams> getAnonParamsList();

  @NotNull
  List<RustBounds> getBoundsList();

  @NotNull
  List<RustExpr> getExprList();

  @Nullable
  RustFnParams getFnParams();

  @Nullable
  RustForeignFnItem getForeignFnItem();

  @NotNull
  List<RustGenericArgs> getGenericArgsList();

  @Nullable
  RustGenericParams getGenericParams();

  @Nullable
  RustLifetimes getLifetimes();

  @NotNull
  List<RustOuterAttr> getOuterAttrList();

  @NotNull
  List<RustRetType> getRetTypeList();

  @NotNull
  List<RustTraitRef> getTraitRefList();

  @NotNull
  List<RustTypeSum> getTypeSumList();

  @NotNull
  List<RustTypeSums> getTypeSumsList();

  @Nullable
  PsiElement getColon();

  @Nullable
  PsiElement getDotdotdot();

  @Nullable
  PsiElement getExtern();

  @Nullable
  PsiElement getFn();

  @Nullable
  PsiElement getFor();

  @Nullable
  PsiElement getProc();

  @Nullable
  PsiElement getPub();

  @Nullable
  PsiElement getSelf();

  @Nullable
  PsiElement getStatic();

  @Nullable
  PsiElement getTypeof();

  @Nullable
  PsiElement getUnderscore();

}
