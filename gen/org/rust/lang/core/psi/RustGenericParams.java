// This is a generated file. Not intended for manual editing.
package org.rust.lang.core.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface RustGenericParams extends RustCompositeElement {

  @Nullable
  RustLifetimes getLifetimes();

  @Nullable
  RustTypeParam getTypeParam();

  @Nullable
  PsiElement getGt();

  @Nullable
  PsiElement getLt();

}
