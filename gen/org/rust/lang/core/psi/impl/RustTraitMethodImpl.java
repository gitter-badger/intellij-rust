// This is a generated file. Not intended for manual editing.
package org.rust.lang.core.psi.impl;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.util.PsiTreeUtil;
import static org.rust.lang.core.psi.RustCompositeElementTypes.*;
import org.rust.lang.core.psi.*;

public class RustTraitMethodImpl extends RustCompositeElementImpl implements RustTraitMethod {

  public RustTraitMethodImpl(ASTNode node) {
    super(node);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof RustVisitor) ((RustVisitor)visitor).visitTraitMethod(this);
    else super.accept(visitor);
  }

  @Override
  @Nullable
  public RustMethod getMethod() {
    return findChildByClass(RustMethod.class);
  }

  @Override
  @Nullable
  public RustTypeMethod getTypeMethod() {
    return findChildByClass(RustTypeMethod.class);
  }

}