---
layout: news_post
title: "Ruby 3.4.4 릴리스"
author: k0kubun
translator: "shia"
date: 2025-05-14 18:20:00 +0000
lang: ko
---

Ruby 3.4.4가 릴리스되었습니다.

이 릴리스는 지역 변수와 관련된 YJIT 버그 수정과 GCC 15를 사용할 때 Windows에서 발생하는 빌드 문제를 해결합니다.
해당 문제를 가급적 빨리 해결하기 위해 예정보다 일찍 릴리스되었습니다.
기타 버그 수정도 포함되어 있습니다.

자세한 내용은 [GitHub 릴리스 노트](https://github.com/ruby/ruby/releases/tag/v3_4_4)를 참조하세요.

## 릴리스 일정

Ruby의 최신 안정 버전(현재 Ruby 3.4)을 2개월마다 릴리스할 계획입니다.
이번 릴리스(3.4.4) 이후, Ruby 3.4.5는 7월, 3.4.6은 9월, 3.4.7은 11월, 3.4.8은 1월에 릴리스될 예정입니다.

만약 많은 사람들에게 영향을 미치는 변경 사항이 발생하면, 예상보다 빨리 릴리스될 수 있으며, 이후 일정도 그에 맞춰서 변경될 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 릴리스 코멘트

많은 커미터, 개발자, 버그를 보고해 준 사용자들이 이 릴리스를 만드는 데 도움을 주었습니다.
그들의 기여에 감사드립니다.
