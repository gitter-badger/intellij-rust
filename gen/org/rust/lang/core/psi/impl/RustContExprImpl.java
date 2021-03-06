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

public class RustContExprImpl extends RustExprImpl implements RustContExpr {

  public RustContExprImpl(ASTNode node) {
    super(node);
  }

  public void accept(@NotNull RustVisitor visitor) {
    visitor.visitContExpr(this);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof RustVisitor) accept((RustVisitor)visitor);
    else super.accept(visitor);
  }

  @Override
  @NotNull
  public PsiElement getContinue() {
    return findNotNullChildByType(CONTINUE);
  }

  @Override
  @Nullable
  public PsiElement getLifetime() {
    return findChildByType(LIFETIME);
  }

  @Override
  @Nullable
  public PsiElement getStaticLifetime() {
    return findChildByType(STATIC_LIFETIME);
  }

}
