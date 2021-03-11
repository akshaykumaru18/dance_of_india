// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DanceFormModal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DanceFormModal> _$danceFormModalSerializer =
    new _$DanceFormModalSerializer();

class _$DanceFormModalSerializer
    implements StructuredSerializer<DanceFormModal> {
  @override
  final Iterable<Type> types = const [DanceFormModal, _$DanceFormModal];
  @override
  final String wireName = 'DanceFormModal';

  @override
  Iterable<Object> serialize(Serializers serializers, DanceFormModal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'poster',
      serializers.serialize(object.poster,
          specifiedType: const FullType(String)),
      'danceName',
      serializers.serialize(object.danceName,
          specifiedType: const FullType(String)),
      'origin',
      serializers.serialize(object.origin,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'infoParagraph1',
      serializers.serialize(object.infoParagraph1,
          specifiedType: const FullType(String)),
      'infoParagraph2',
      serializers.serialize(object.infoParagraph2,
          specifiedType: const FullType(String)),
      'wikiLink',
      serializers.serialize(object.wikiLink,
          specifiedType: const FullType(String)),
      'imgList',
      serializers.serialize(object.imgList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  DanceFormModal deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DanceFormModalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'poster':
          result.poster = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'danceName':
          result.danceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin':
          result.origin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infoParagraph1':
          result.infoParagraph1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infoParagraph2':
          result.infoParagraph2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wikiLink':
          result.wikiLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imgList':
          result.imgList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DanceFormModal extends DanceFormModal {
  @override
  final String poster;
  @override
  final String danceName;
  @override
  final String origin;
  @override
  final String description;
  @override
  final String infoParagraph1;
  @override
  final String infoParagraph2;
  @override
  final String wikiLink;
  @override
  final BuiltList<String> imgList;

  factory _$DanceFormModal([void Function(DanceFormModalBuilder) updates]) =>
      (new DanceFormModalBuilder()..update(updates)).build();

  _$DanceFormModal._(
      {this.poster,
      this.danceName,
      this.origin,
      this.description,
      this.infoParagraph1,
      this.infoParagraph2,
      this.wikiLink,
      this.imgList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(poster, 'DanceFormModal', 'poster');
    BuiltValueNullFieldError.checkNotNull(
        danceName, 'DanceFormModal', 'danceName');
    BuiltValueNullFieldError.checkNotNull(origin, 'DanceFormModal', 'origin');
    BuiltValueNullFieldError.checkNotNull(
        description, 'DanceFormModal', 'description');
    BuiltValueNullFieldError.checkNotNull(
        infoParagraph1, 'DanceFormModal', 'infoParagraph1');
    BuiltValueNullFieldError.checkNotNull(
        infoParagraph2, 'DanceFormModal', 'infoParagraph2');
    BuiltValueNullFieldError.checkNotNull(
        wikiLink, 'DanceFormModal', 'wikiLink');
    BuiltValueNullFieldError.checkNotNull(imgList, 'DanceFormModal', 'imgList');
  }

  @override
  DanceFormModal rebuild(void Function(DanceFormModalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DanceFormModalBuilder toBuilder() =>
      new DanceFormModalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DanceFormModal &&
        poster == other.poster &&
        danceName == other.danceName &&
        origin == other.origin &&
        description == other.description &&
        infoParagraph1 == other.infoParagraph1 &&
        infoParagraph2 == other.infoParagraph2 &&
        wikiLink == other.wikiLink &&
        imgList == other.imgList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, poster.hashCode), danceName.hashCode),
                            origin.hashCode),
                        description.hashCode),
                    infoParagraph1.hashCode),
                infoParagraph2.hashCode),
            wikiLink.hashCode),
        imgList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DanceFormModal')
          ..add('poster', poster)
          ..add('danceName', danceName)
          ..add('origin', origin)
          ..add('description', description)
          ..add('infoParagraph1', infoParagraph1)
          ..add('infoParagraph2', infoParagraph2)
          ..add('wikiLink', wikiLink)
          ..add('imgList', imgList))
        .toString();
  }
}

class DanceFormModalBuilder
    implements Builder<DanceFormModal, DanceFormModalBuilder> {
  _$DanceFormModal _$v;

  String _poster;
  String get poster => _$this._poster;
  set poster(String poster) => _$this._poster = poster;

  String _danceName;
  String get danceName => _$this._danceName;
  set danceName(String danceName) => _$this._danceName = danceName;

  String _origin;
  String get origin => _$this._origin;
  set origin(String origin) => _$this._origin = origin;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _infoParagraph1;
  String get infoParagraph1 => _$this._infoParagraph1;
  set infoParagraph1(String infoParagraph1) =>
      _$this._infoParagraph1 = infoParagraph1;

  String _infoParagraph2;
  String get infoParagraph2 => _$this._infoParagraph2;
  set infoParagraph2(String infoParagraph2) =>
      _$this._infoParagraph2 = infoParagraph2;

  String _wikiLink;
  String get wikiLink => _$this._wikiLink;
  set wikiLink(String wikiLink) => _$this._wikiLink = wikiLink;

  ListBuilder<String> _imgList;
  ListBuilder<String> get imgList =>
      _$this._imgList ??= new ListBuilder<String>();
  set imgList(ListBuilder<String> imgList) => _$this._imgList = imgList;

  DanceFormModalBuilder();

  DanceFormModalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _poster = $v.poster;
      _danceName = $v.danceName;
      _origin = $v.origin;
      _description = $v.description;
      _infoParagraph1 = $v.infoParagraph1;
      _infoParagraph2 = $v.infoParagraph2;
      _wikiLink = $v.wikiLink;
      _imgList = $v.imgList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DanceFormModal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DanceFormModal;
  }

  @override
  void update(void Function(DanceFormModalBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DanceFormModal build() {
    _$DanceFormModal _$result;
    try {
      _$result = _$v ??
          new _$DanceFormModal._(
              poster: BuiltValueNullFieldError.checkNotNull(
                  poster, 'DanceFormModal', 'poster'),
              danceName: BuiltValueNullFieldError.checkNotNull(
                  danceName, 'DanceFormModal', 'danceName'),
              origin: BuiltValueNullFieldError.checkNotNull(
                  origin, 'DanceFormModal', 'origin'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, 'DanceFormModal', 'description'),
              infoParagraph1: BuiltValueNullFieldError.checkNotNull(
                  infoParagraph1, 'DanceFormModal', 'infoParagraph1'),
              infoParagraph2: BuiltValueNullFieldError.checkNotNull(
                  infoParagraph2, 'DanceFormModal', 'infoParagraph2'),
              wikiLink: BuiltValueNullFieldError.checkNotNull(
                  wikiLink, 'DanceFormModal', 'wikiLink'),
              imgList: imgList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imgList';
        imgList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DanceFormModal', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
