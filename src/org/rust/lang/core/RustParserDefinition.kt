package org.rust.lang.core

import com.intellij.json.JsonLanguage
import com.intellij.lang.ASTNode
import com.intellij.lang.ParserDefinition
import com.intellij.lang.PsiParser
import com.intellij.lexer.Lexer
import com.intellij.openapi.project.Project
import com.intellij.psi.FileViewProvider
import com.intellij.psi.PsiElement
import com.intellij.psi.PsiFile
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IFileElementType
import com.intellij.psi.tree.TokenSet
import org.rust.lang.RustLanguage
import org.rust.lang.core.lexer.RustLexer
import org.rust.lang.core.parser.RustParser
import org.rust.lang.core.lexer.RustTokenElementTypes.*
import org.rust.lang.core.psi.RustCompositeElementTypes
import org.rust.lang.core.psi.impl.RustFileImpl

public class RustParserDefinition : ParserDefinition {

    val RUST_FILE_TYPE: IFileElementType = IFileElementType(RustLanguage.INSTANCE)

    override fun createFile(viewProvider: FileViewProvider): PsiFile? =
        RustFileImpl(viewProvider)

    override fun spaceExistanceTypeBetweenTokens(left: ASTNode?, right: ASTNode?): ParserDefinition.SpaceRequirements? {
        // TODO(kudinkin): Fix
        return ParserDefinition.SpaceRequirements.MUST
    }

    override fun getFileNodeType(): IFileElementType? = RUST_FILE_TYPE

    override fun getStringLiteralElements(): TokenSet =
        TokenSet.create(STRING_LITERAL)

    override fun getWhitespaceTokens(): TokenSet =
        TokenSet.create(TokenType.WHITE_SPACE)

    override fun getCommentTokens() =
        TokenSet.create(BLOCK_COMMENT, EOL_COMMENT, INNER_DOC_COMMENT, OUTER_DOC_COMMENT)

    override fun createElement(node: ASTNode?): PsiElement =
        RustCompositeElementTypes.Factory.createElement(node)

    override fun createLexer(project: Project?): Lexer = RustLexer()

    override fun createParser(project: Project?): PsiParser = RustParser()
}