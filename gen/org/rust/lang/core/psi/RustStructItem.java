// This is a generated file. Not intended for manual editing.
package org.rust.lang.core.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface RustStructItem extends RustCompositeElement {

  @NotNull
  RustGenericParams getGenericParams();

  @Nullable
  RustStructDeclArgs getStructDeclArgs();

  @Nullable
  RustStructTupleArgs getStructTupleArgs();

  @Nullable
  RustWhereClause getWhereClause();

  @NotNull
  PsiElement getIdentifier();

  @Nullable
  PsiElement getSemicolon();

  @NotNull
  PsiElement getStruct();

}
