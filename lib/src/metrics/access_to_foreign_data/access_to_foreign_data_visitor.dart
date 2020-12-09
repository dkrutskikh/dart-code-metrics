import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class AccessToForeignDataVisitor extends RecursiveAstVisitor<void> {
  final _invocationsDeclarations = <SimpleIdentifier>{};

  int get count => _invocationsDeclarations.length;

  @override
  void visitPropertyAccess(PropertyAccess node) {
    _invocationsDeclarations.add(node.propertyName);

    super.visitPropertyAccess(node);
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    super.visitMethodInvocation(node);
  }

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    node.visitChildren(this);
  }


  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    node.visitChildren(this);
  }

  @override
  void visitAnnotation(Annotation node) {
    node.visitChildren(this);
  }

  @override
  void visitArgumentList(ArgumentList node) {
    node.visitChildren(this);
  }

  @override
  void visitAsExpression(AsExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitAssertStatement(AssertStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitAssignmentExpression(AssignmentExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitAwaitExpression(AwaitExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitBinaryExpression(BinaryExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitBlock(Block node) {
    node.visitChildren(this);
  }

  @override
  void visitBlockFunctionBody(BlockFunctionBody node) {
    node.visitChildren(this);
  }

  @override
  void visitBooleanLiteral(BooleanLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitBreakStatement(BreakStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitCascadeExpression(CascadeExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitCatchClause(CatchClause node) {
    node.visitChildren(this);
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitClassTypeAlias(ClassTypeAlias node) {
    node.visitChildren(this);
  }

  @override
  void visitComment(Comment node) {
    node.visitChildren(this);
  }

  @override
  void visitCommentReference(CommentReference node) {
    node.visitChildren(this);
  }

  @override
  void visitCompilationUnit(CompilationUnit node) {
    node.visitChildren(this);
  }

  @override
  void visitConditionalExpression(ConditionalExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitConfiguration(Configuration node) {
    node.visitChildren(this);
  }

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitConstructorName(ConstructorName node) {
    node.visitChildren(this);
  }

  @override
  void visitContinueStatement(ContinueStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitDoStatement(DoStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitDottedName(DottedName node) {
    node.visitChildren(this);
  }

  @override
  void visitDoubleLiteral(DoubleLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitEmptyFunctionBody(EmptyFunctionBody node) {
    node.visitChildren(this);
  }

  @override
  void visitEmptyStatement(EmptyStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitEnumConstantDeclaration(EnumConstantDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitExportDirective(ExportDirective node) {
    node.visitChildren(this);
  }

  @override
  void visitExpressionFunctionBody(ExpressionFunctionBody node) {
    node.visitChildren(this);
  }

  @override
  void visitExpressionStatement(ExpressionStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitExtendsClause(ExtendsClause node) {
    node.visitChildren(this);
  }

  @override
  void visitExtensionDeclaration(ExtensionDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitExtensionOverride(ExtensionOverride node) {
    node.visitChildren(this);
  }

  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitForElement(ForElement node) {
    node.visitChildren(this);
  }

  @override
  void visitFormalParameterList(FormalParameterList node) {
    node.visitChildren(this);
  }

  @override
  void visitForPartsWithDeclarations(ForPartsWithDeclarations node) {
    node.visitChildren(this);
  }

  @override
  void visitForPartsWithExpression(ForPartsWithExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitForStatement(ForStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitFunctionExpression(FunctionExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitFunctionTypeAlias(FunctionTypeAlias node) {
    node.visitChildren(this);
  }

  @override
  void visitGenericFunctionType(GenericFunctionType node) {
    node.visitChildren(this);
  }

  @override
  void visitGenericTypeAlias(GenericTypeAlias node) {
    node.visitChildren(this);
  }

  @override
  void visitIfElement(IfElement node) {
    node.visitChildren(this);
  }

  @override
  void visitIfStatement(IfStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitImplementsClause(ImplementsClause node) {
    node.visitChildren(this);
  }

  @override
  void visitImportDirective(ImportDirective node) {
    node.visitChildren(this);
  }

  @override
  void visitIndexExpression(IndexExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitIntegerLiteral(IntegerLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitInterpolationExpression(InterpolationExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitInterpolationString(InterpolationString node) {
    node.visitChildren(this);
  }

  @override
  void visitIsExpression(IsExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitLabel(Label node) {
    node.visitChildren(this);
  }

  @override
  void visitLabeledStatement(LabeledStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitLibraryDirective(LibraryDirective node) {
    node.visitChildren(this);
  }

  @override
  void visitListLiteral(ListLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitMapLiteralEntry(MapLiteralEntry node) {
    node.visitChildren(this);
  }

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitMixinDeclaration(MixinDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitNamedExpression(NamedExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitNativeClause(NativeClause node) {
    node.visitChildren(this);
  }

  @override
  void visitNativeFunctionBody(NativeFunctionBody node) {
    node.visitChildren(this);
  }

  @override
  void visitNullLiteral(NullLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitOnClause(OnClause node) {
    node.visitChildren(this);
  }

  @override
  void visitParenthesizedExpression(ParenthesizedExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitPartDirective(PartDirective node) {
    node.visitChildren(this);
  }

  @override
  void visitPartOfDirective(PartOfDirective node) {
    node.visitChildren(this);
  }

  @override
  void visitPostfixExpression(PostfixExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitPrefixExpression(PrefixExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitRedirectingConstructorInvocation(
      RedirectingConstructorInvocation node) {
    node.visitChildren(this);
  }

  @override
  void visitRethrowExpression(RethrowExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitReturnStatement(ReturnStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitScriptTag(ScriptTag node) {
    node.visitChildren(this);
  }

  @override
  void visitSetOrMapLiteral(SetOrMapLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitSpreadElement(SpreadElement node) {
    node.visitChildren(this);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    node.visitChildren(this);
  }

  @override
  void visitSuperConstructorInvocation(SuperConstructorInvocation node) {
    node.visitChildren(this);
  }

  @override
  void visitSuperExpression(SuperExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitSwitchCase(SwitchCase node) {
    node.visitChildren(this);
  }

  @override
  void visitSwitchDefault(SwitchDefault node) {
    node.visitChildren(this);
  }

  @override
  void visitSwitchStatement(SwitchStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitSymbolLiteral(SymbolLiteral node) {
    node.visitChildren(this);
  }

  @override
  void visitThisExpression(ThisExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitThrowExpression(ThrowExpression node) {
    node.visitChildren(this);
  }

  @override
  void visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitTryStatement(TryStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitTypeArgumentList(TypeArgumentList node) {
    node.visitChildren(this);
  }

  @override
  void visitTypeName(TypeName node) {
    node.visitChildren(this);
  }

  @override
  void visitTypeParameterList(TypeParameterList node) {
    node.visitChildren(this);
  }

  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    node.visitChildren(this);
  }

  @override
  void visitVariableDeclarationList(VariableDeclarationList node) {
    node.visitChildren(this);
  }

  @override
  void visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitWhileStatement(WhileStatement node) {
    node.visitChildren(this);
  }

  @override
  void visitWithClause(WithClause node) {
    node.visitChildren(this);
  }

  @override
  void visitYieldStatement(YieldStatement node) {
    node.visitChildren(this);
  }
}
