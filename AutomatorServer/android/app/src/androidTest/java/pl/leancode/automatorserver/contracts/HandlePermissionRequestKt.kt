//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: contracts.proto

package pl.leancode.automatorserver.contracts;

@kotlin.jvm.JvmName("-initializehandlePermissionRequest")
inline fun handlePermissionRequest(block: pl.leancode.automatorserver.contracts.HandlePermissionRequestKt.Dsl.() -> kotlin.Unit): pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest =
  pl.leancode.automatorserver.contracts.HandlePermissionRequestKt.Dsl._create(pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest.newBuilder()).apply { block() }._build()
object HandlePermissionRequestKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  class Dsl private constructor(
    private val _builder: pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest.Builder
  ) {
    companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest = _builder.build()

    /**
     * <code>.patrol.HandlePermissionRequest.Code code = 1;</code>
     */
     var code: pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest.Code
      @JvmName("getCode")
      get() = _builder.getCode()
      @JvmName("setCode")
      set(value) {
        _builder.setCode(value)
      }
    /**
     * <code>.patrol.HandlePermissionRequest.Code code = 1;</code>
     */
    fun clearCode() {
      _builder.clearCode()
    }
  }
}
@kotlin.jvm.JvmSynthetic
inline fun pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest.copy(block: pl.leancode.automatorserver.contracts.HandlePermissionRequestKt.Dsl.() -> kotlin.Unit): pl.leancode.automatorserver.contracts.Contracts.HandlePermissionRequest =
  pl.leancode.automatorserver.contracts.HandlePermissionRequestKt.Dsl._create(this.toBuilder()).apply { block() }._build()

