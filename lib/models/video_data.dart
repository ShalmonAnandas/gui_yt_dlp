import 'dart:convert';

YtDlpVideoData ytDlpVideoDataFromJson(String str) => YtDlpVideoData.fromJson(json.decode(str));

String ytDlpVideoDataToJson(YtDlpVideoData data) => json.encode(data.toJson());

class YtDlpVideoData {
  String id;
  String title;
  List<Format> formats;
  List<Thumbnail> thumbnails;
  String thumbnail;
  String description;
  String channelId;
  String channelUrl;
  int duration;
  int viewCount;
  dynamic averageRating;
  int ageLimit;
  String webpageUrl;
  List<String> categories;
  List<String> tags;
  bool playableInEmbed;
  String liveStatus;
  dynamic releaseTimestamp;
  List<String> formatSortFields;
  Map<String, List<AutomaticCaption>> automaticCaptions;
  Subtitles subtitles;
  dynamic commentCount;
  dynamic chapters;
  dynamic uploader;
  String uploaderId;
  String uploaderUrl;
  String uploadDate;
  String availability;
  String originalUrl;
  String webpageUrlBasename;
  String webpageUrlDomain;
  String extractor;
  String extractorKey;
  dynamic playlist;
  dynamic playlistIndex;
  String displayId;
  String fulltitle;
  String durationString;
  bool isLive;
  bool wasLive;
  dynamic requestedSubtitles;
  dynamic hasDrm;
  int epoch;
  List<Format> requestedFormats;
  String format;
  String formatId;
  String ext;
  String protocol;
  String language;
  String formatNote;
  int filesizeApprox;
  double tbr;
  int width;
  int height;
  String resolution;
  int fps;
  String dynamicRange;
  String vcodec;
  double vbr;
  dynamic stretchedRatio;
  double aspectRatio;
  String acodec;
  double abr;
  int asr;
  int audioChannels;
  String filename;
  String ytDlpVideoDataFilename;
  String type;
  Version version;

  YtDlpVideoData({
    required this.id,
    required this.title,
    required this.formats,
    required this.thumbnails,
    required this.thumbnail,
    required this.description,
    required this.channelId,
    required this.channelUrl,
    required this.duration,
    required this.viewCount,
    this.averageRating,
    required this.ageLimit,
    required this.webpageUrl,
    required this.categories,
    required this.tags,
    required this.playableInEmbed,
    required this.liveStatus,
    this.releaseTimestamp,
    required this.formatSortFields,
    required this.automaticCaptions,
    required this.subtitles,
    this.commentCount,
    this.chapters,
    this.uploader,
    required this.uploaderId,
    required this.uploaderUrl,
    required this.uploadDate,
    required this.availability,
    required this.originalUrl,
    required this.webpageUrlBasename,
    required this.webpageUrlDomain,
    required this.extractor,
    required this.extractorKey,
    this.playlist,
    this.playlistIndex,
    required this.displayId,
    required this.fulltitle,
    required this.durationString,
    required this.isLive,
    required this.wasLive,
    this.requestedSubtitles,
    this.hasDrm,
    required this.epoch,
    required this.requestedFormats,
    required this.format,
    required this.formatId,
    required this.ext,
    required this.protocol,
    required this.language,
    required this.formatNote,
    required this.filesizeApprox,
    required this.tbr,
    required this.width,
    required this.height,
    required this.resolution,
    required this.fps,
    required this.dynamicRange,
    required this.vcodec,
    required this.vbr,
    this.stretchedRatio,
    required this.aspectRatio,
    required this.acodec,
    required this.abr,
    required this.asr,
    required this.audioChannels,
    required this.filename,
    required this.ytDlpVideoDataFilename,
    required this.type,
    required this.version,
  });

  factory YtDlpVideoData.fromJson(Map<String, dynamic> json) => YtDlpVideoData(
        id: json["id"],
        title: json["title"],
        formats: List<Format>.from(json["formats"].map((x) => Format.fromJson(x))),
        thumbnails: List<Thumbnail>.from(json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
        thumbnail: json["thumbnail"],
        description: json["description"],
        channelId: json["channel_id"],
        channelUrl: json["channel_url"],
        duration: json["duration"],
        viewCount: json["view_count"],
        averageRating: json["average_rating"],
        ageLimit: json["age_limit"],
        webpageUrl: json["webpage_url"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        playableInEmbed: json["playable_in_embed"],
        liveStatus: json["live_status"],
        releaseTimestamp: json["release_timestamp"],
        formatSortFields: List<String>.from(json["_format_sort_fields"].map((x) => x)),
        automaticCaptions: Map.from(json["automatic_captions"])
            .map((k, v) => MapEntry<String, List<AutomaticCaption>>(k, List<AutomaticCaption>.from(v.map((x) => AutomaticCaption.fromJson(x))))),
        subtitles: Subtitles.fromJson(json["subtitles"]),
        commentCount: json["comment_count"],
        chapters: json["chapters"],
        uploader: json["uploader"],
        uploaderId: json["uploader_id"],
        uploaderUrl: json["uploader_url"],
        uploadDate: json["upload_date"],
        availability: json["availability"],
        originalUrl: json["original_url"],
        webpageUrlBasename: json["webpage_url_basename"],
        webpageUrlDomain: json["webpage_url_domain"],
        extractor: json["extractor"],
        extractorKey: json["extractor_key"],
        playlist: json["playlist"],
        playlistIndex: json["playlist_index"],
        displayId: json["display_id"],
        fulltitle: json["fulltitle"],
        durationString: json["duration_string"],
        isLive: json["is_live"],
        wasLive: json["was_live"],
        requestedSubtitles: json["requested_subtitles"],
        hasDrm: json["_has_drm"],
        epoch: json["epoch"],
        requestedFormats: List<Format>.from(json["requested_formats"].map((x) => Format.fromJson(x))),
        format: json["format"],
        formatId: json["format_id"],
        ext: json["ext"],
        protocol: json["protocol"],
        language: json["language"],
        formatNote: json["format_note"],
        filesizeApprox: json["filesize_approx"],
        tbr: json["tbr"]?.toDouble(),
        width: json["width"],
        height: json["height"],
        resolution: json["resolution"],
        fps: json["fps"],
        dynamicRange: json["dynamic_range"],
        vcodec: json["vcodec"],
        vbr: json["vbr"]?.toDouble(),
        stretchedRatio: json["stretched_ratio"],
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        acodec: json["acodec"],
        abr: json["abr"]?.toDouble(),
        asr: json["asr"],
        audioChannels: json["audio_channels"],
        filename: json["_filename"],
        ytDlpVideoDataFilename: json["filename"],
        type: json["_type"],
        version: Version.fromJson(json["_version"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "formats": List<dynamic>.from(formats.map((x) => x.toJson())),
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
        "thumbnail": thumbnail,
        "description": description,
        "channel_id": channelId,
        "channel_url": channelUrl,
        "duration": duration,
        "view_count": viewCount,
        "average_rating": averageRating,
        "age_limit": ageLimit,
        "webpage_url": webpageUrl,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "playable_in_embed": playableInEmbed,
        "live_status": liveStatus,
        "release_timestamp": releaseTimestamp,
        "_format_sort_fields": List<dynamic>.from(formatSortFields.map((x) => x)),
        "automatic_captions": Map.from(automaticCaptions).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "subtitles": subtitles.toJson(),
        "comment_count": commentCount,
        "chapters": chapters,
        "uploader": uploader,
        "uploader_id": uploaderId,
        "uploader_url": uploaderUrl,
        "upload_date": uploadDate,
        "availability": availability,
        "original_url": originalUrl,
        "webpage_url_basename": webpageUrlBasename,
        "webpage_url_domain": webpageUrlDomain,
        "extractor": extractor,
        "extractor_key": extractorKey,
        "playlist": playlist,
        "playlist_index": playlistIndex,
        "display_id": displayId,
        "fulltitle": fulltitle,
        "duration_string": durationString,
        "is_live": isLive,
        "was_live": wasLive,
        "requested_subtitles": requestedSubtitles,
        "_has_drm": hasDrm,
        "epoch": epoch,
        "requested_formats": List<dynamic>.from(requestedFormats.map((x) => x.toJson())),
        "format": format,
        "format_id": formatId,
        "ext": ext,
        "protocol": protocol,
        "language": language,
        "format_note": formatNote,
        "filesize_approx": filesizeApprox,
        "tbr": tbr,
        "width": width,
        "height": height,
        "resolution": resolution,
        "fps": fps,
        "dynamic_range": dynamicRange,
        "vcodec": vcodec,
        "vbr": vbr,
        "stretched_ratio": stretchedRatio,
        "aspect_ratio": aspectRatio,
        "acodec": acodec,
        "abr": abr,
        "asr": asr,
        "audio_channels": audioChannels,
        "_filename": filename,
        "filename": ytDlpVideoDataFilename,
        "_type": type,
        "_version": version.toJson(),
      };
}

class AutomaticCaption {
  String ext;
  String url;
  String name;

  AutomaticCaption({
    required this.ext,
    required this.url,
    required this.name,
  });

  factory AutomaticCaption.fromJson(Map<String, dynamic> json) => AutomaticCaption(
        ext: json["ext"],
        url: json["url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "name": name,
      };
}

class Format {
  String formatId;
  String? formatNote;
  String ext;
  String protocol;
  String? acodec;
  String vcodec;
  String url;
  int? width;
  int? height;
  double? fps;
  int? rows;
  int? columns;
  List<Fragment>? fragments;
  String resolution;
  double? aspectRatio;
  HttpHeaders httpHeaders;
  String audioExt;
  String videoExt;
  double? vbr;
  double? abr;
  double? tbr;
  String format;
  dynamic formatIndex;
  String? manifestUrl;
  String? language;
  int? preference;
  var quality;
  bool? hasDrm;
  int? sourcePreference;
  int? asr;
  int? filesize;
  int? audioChannels;
  int? languagePreference;
  String? dynamicRange;
  String? container;
  DownloaderOptions? downloaderOptions;
  int? filesizeApprox;

  Format({
    required this.formatId,
    this.formatNote,
    required this.ext,
    required this.protocol,
    this.acodec,
    required this.vcodec,
    required this.url,
    this.width,
    this.height,
    this.fps,
    this.rows,
    this.columns,
    this.fragments,
    required this.resolution,
    this.aspectRatio,
    required this.httpHeaders,
    required this.audioExt,
    required this.videoExt,
    this.vbr,
    this.abr,
    this.tbr,
    required this.format,
    this.formatIndex,
    this.manifestUrl,
    this.language,
    this.preference,
    this.quality,
    this.hasDrm,
    this.sourcePreference,
    this.asr,
    this.filesize,
    this.audioChannels,
    this.languagePreference,
    this.dynamicRange,
    this.container,
    this.downloaderOptions,
    this.filesizeApprox,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        formatId: json["format_id"],
        formatNote: json["format_note"],
        ext: json["ext"],
        protocol: json["protocol"],
        acodec: json["acodec"],
        vcodec: json["vcodec"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        fps: json["fps"]?.toDouble(),
        rows: json["rows"],
        columns: json["columns"],
        fragments: json["fragments"] == null ? [] : List<Fragment>.from(json["fragments"]!.map((x) => Fragment.fromJson(x))),
        resolution: json["resolution"],
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        httpHeaders: HttpHeaders.fromJson(json["http_headers"]),
        audioExt: json["audio_ext"],
        videoExt: json["video_ext"],
        vbr: json["vbr"]?.toDouble(),
        abr: json["abr"]?.toDouble(),
        tbr: json["tbr"]?.toDouble(),
        format: json["format"],
        formatIndex: json["format_index"],
        manifestUrl: json["manifest_url"],
        language: json["language"],
        preference: json["preference"],
        quality: json["quality"],
        hasDrm: json["has_drm"],
        sourcePreference: json["source_preference"],
        asr: json["asr"],
        filesize: json["filesize"],
        audioChannels: json["audio_channels"],
        languagePreference: json["language_preference"],
        dynamicRange: json["dynamic_range"],
        container: json["container"],
        downloaderOptions: json["downloader_options"] == null ? null : DownloaderOptions.fromJson(json["downloader_options"]),
        filesizeApprox: json["filesize_approx"],
      );

  Map<String, dynamic> toJson() => {
        "format_id": formatId,
        "format_note": formatNote,
        "ext": ext,
        "protocol": protocol,
        "acodec": acodec,
        "vcodec": vcodec,
        "url": url,
        "width": width,
        "height": height,
        "fps": fps,
        "rows": rows,
        "columns": columns,
        "fragments": fragments == null ? [] : List<dynamic>.from(fragments!.map((x) => x.toJson())),
        "resolution": resolution,
        "aspect_ratio": aspectRatio,
        "http_headers": httpHeaders.toJson(),
        "audio_ext": audioExt,
        "video_ext": videoExt,
        "vbr": vbr,
        "abr": abr,
        "tbr": tbr,
        "format": format,
        "format_index": formatIndex,
        "manifest_url": manifestUrl,
        "language": language,
        "preference": preference,
        "quality": quality,
        "has_drm": hasDrm,
        "source_preference": sourcePreference,
        "asr": asr,
        "filesize": filesize,
        "audio_channels": audioChannels,
        "language_preference": languagePreference,
        "dynamic_range": dynamicRange,
        "container": container,
        "downloader_options": downloaderOptions?.toJson(),
        "filesize_approx": filesizeApprox,
      };
}

class DownloaderOptions {
  int httpChunkSize;

  DownloaderOptions({
    required this.httpChunkSize,
  });

  factory DownloaderOptions.fromJson(Map<String, dynamic> json) => DownloaderOptions(
        httpChunkSize: json["http_chunk_size"],
      );

  Map<String, dynamic> toJson() => {
        "http_chunk_size": httpChunkSize,
      };
}

class Fragment {
  String url;
  double duration;

  Fragment({
    required this.url,
    required this.duration,
  });

  factory Fragment.fromJson(Map<String, dynamic> json) => Fragment(
        url: json["url"],
        duration: json["duration"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "duration": duration,
      };
}

class HttpHeaders {
  String userAgent;
  String accept;
  String acceptLanguage;
  String secFetchMode;

  HttpHeaders({
    required this.userAgent,
    required this.accept,
    required this.acceptLanguage,
    required this.secFetchMode,
  });

  factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
        userAgent: json["User-Agent"],
        accept: json["Accept"],
        acceptLanguage: json["Accept-Language"],
        secFetchMode: json["Sec-Fetch-Mode"],
      );

  Map<String, dynamic> toJson() => {
        "User-Agent": userAgent,
        "Accept": accept,
        "Accept-Language": acceptLanguage,
        "Sec-Fetch-Mode": secFetchMode,
      };
}

class Heatmap {
  double startTime;
  double endTime;
  double value;

  Heatmap({
    required this.startTime,
    required this.endTime,
    required this.value,
  });

  factory Heatmap.fromJson(Map<String, dynamic> json) => Heatmap(
        startTime: json["start_time"]?.toDouble(),
        endTime: json["end_time"]?.toDouble(),
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "value": value,
      };
}

class Subtitles {
  Subtitles();

  factory Subtitles.fromJson(Map<String, dynamic> json) => Subtitles();

  Map<String, dynamic> toJson() => {};
}

class Thumbnail {
  String url;
  int preference;
  String id;
  int? height;
  int? width;
  String? resolution;

  Thumbnail({
    required this.url,
    required this.preference,
    required this.id,
    this.height,
    this.width,
    this.resolution,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json["url"],
        preference: json["preference"],
        id: json["id"],
        height: json["height"],
        width: json["width"],
        resolution: json["resolution"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "preference": preference,
        "id": id,
        "height": height,
        "width": width,
        "resolution": resolution,
      };
}

class Version {
  String version;
  dynamic currentGitHead;
  String releaseGitHead;
  String repository;

  Version({
    required this.version,
    this.currentGitHead,
    required this.releaseGitHead,
    required this.repository,
  });

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        version: json["version"],
        currentGitHead: json["current_git_head"],
        releaseGitHead: json["release_git_head"],
        repository: json["repository"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "current_git_head": currentGitHead,
        "release_git_head": releaseGitHead,
        "repository": repository,
      };
}
