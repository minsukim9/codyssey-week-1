# Codyssey Week 1

## 1. 프로젝트 개요

터미널, Docker, Git/GitHub를 활용하여 재현 가능한 개발 워크스테이션을 구축하고, 실행 과정과 검증 결과를 문서화하는 미션입니다.

## 2. 실행 환경

- OS: macOS
- Architecture: Apple Silicon ARM64
- Shell: zsh
- Terminal: macOS Terminal
- Docker Client: 28.1.1
- Docker Context: desktop-linux
- Git: 2.51.0

## 3. 수행 체크리스트

- [ ] 터미널 기본 조작
- [ ] 파일 및 디렉토리 권한 실습
- [ ] Docker 실행 환경 점검
- [ ] hello-world 컨테이너 실행
- [ ] Ubuntu 컨테이너 실습
- [ ] Dockerfile 기반 커스텀 이미지 제작
- [ ] 포트 매핑 검증
- [ ] 바인드 마운트 검증
- [ ] Docker 볼륨 영속성 검증
- [ ] Git 및 GitHub 연동
- [ ] 트러블슈팅 2건 이상 작성

## 4. 터미널 기본 조작

터미널에서 디렉토리와 파일을 생성하고, 복사·이동·삭제하는 기본 명령어를 실습했습니다.

### 4.1 현재 위치와 파일 목록 확인

`pwd` 명령으로 현재 작업 중인 디렉토리의 절대 경로를 확인하고, `ls -la` 명령으로 숨김 파일을 포함한 전체 파일 목록을 확인했습니다.

```bash
pwd
ls -la
```

![현재 위치와 파일 목록 확인](./images/terminal-practice/cd_pwd.png)

### 4.2 파일과 디렉토리 생성

`mkdir` 명령으로 `sample-dir` 디렉토리를 생성하고, `touch` 명령으로 `original.txt` 파일을 생성했습니다.

이후 출력 리다이렉션인 `>`를 사용하여 `original.txt` 파일에 `Hello Codyssey` 문자열을 작성했습니다.

```bash
mkdir sample-dir
touch original.txt
echo "Hello Codyssey" > original.txt
ls -la
cat original.txt
```

![파일과 디렉토리 생성](./images/terminal-practice/파일과디렉토리생성.png)

### 4.3 파일 복사

`cp` 명령을 사용하여 `original.txt` 파일을 `copied.txt`라는 이름으로 복사했습니다.

```bash
cp original.txt copied.txt
ls -la
```

![파일 복사](./images/terminal-practice/파일복사.png)

### 4.4 파일 이름 변경 및 이동

`mv` 명령을 사용하여 `copied.txt` 파일의 이름을 `renamed.txt`로 변경했습니다.

이후 같은 `mv` 명령을 사용해 `renamed.txt` 파일을 `sample-dir` 디렉토리로 이동했습니다.

```bash
mv copied.txt renamed.txt
mv renamed.txt sample-dir/
ls -la
ls -la sample-dir
```

![파일 이름 변경 및 이동](./images/terminal-practice/파일이름변경및이동.png)

### 4.5 파일 내용 확인

`cat` 명령으로 `sample-dir` 디렉토리 안에 있는 `renamed.txt` 파일의 내용을 확인했습니다.

```bash
cat sample-dir/renamed.txt
```

```text
Hello Codyssey
```

![파일 내용 확인](./images/terminal-practice/파일내용확인.png)

### 4.6 파일과 디렉토리 삭제

`rm` 명령으로 `sample-dir` 내부의 `renamed.txt` 파일을 삭제했습니다.

파일을 삭제한 뒤 비어 있는 `sample-dir` 디렉토리는 `rmdir` 명령으로 삭제했습니다.

```bash
rm sample-dir/renamed.txt
rmdir sample-dir
ls -la
```

![파일과 디렉토리 삭제](./images/terminal-practice/파일과디렉토리삭제.png)

실습이 끝난 후에는 최초에 생성한 `original.txt` 파일만 남겨 두었습니다.

현재 터미널 실습 디렉토리의 구조는 다음과 같습니다.

```text
terminal-practice/
└── original.txt
```

### 4.7 절대 경로와 상대 경로

절대 경로는 루트 디렉토리부터 특정 파일이나 디렉토리까지의 전체 위치를 표현한 경로입니다.

현재 프로젝트의 `original.txt` 파일을 절대 경로로 표현하면 다음과 같은 형태가 됩니다.

```text
/Users/<username>/<workspace>/codyssey-week-1/terminal-practice/original.txt
```

사용자 이름과 프로젝트를 저장한 상위 디렉토리는 실행 환경에 따라 달라질 수 있습니다.

상대 경로는 현재 작업 중인 디렉토리를 기준으로 파일이나 디렉토리의 위치를 표현합니다.

현재 위치가 프로젝트 루트인 `codyssey-week-1`이라면 다음 상대 경로로 `original.txt` 파일을 표현할 수 있습니다.

```text
./terminal-practice/original.txt
```

현재 위치가 `terminal-practice`라면 다음과 같이 표현할 수 있습니다.

```text
./original.txt
```

`terminal-practice`에서 상위 디렉토리에 있는 `README.md`는 다음 상대 경로로 접근할 수 있습니다.

```text
../README.md
```

정리하면 다음과 같습니다.

| 표현 | 의미 |
|---|---|
| `/Users/.../original.txt` | 루트부터 시작하는 절대 경로 |
| `./original.txt` | 현재 디렉토리에 있는 파일 |
| `../README.md` | 현재 디렉토리의 상위 디렉토리에 있는 파일 |

### 4.8 프로젝트 디렉토리 구조

터미널 기본 조작 실습을 완료한 후의 프로젝트 구조는 다음과 같습니다.

```text
.
├── README.md
├── images
│   └── terminal-practice
│       ├── cd_pwd.png
│       ├── 파일과디렉토리삭제.png
│       ├── 파일과디렉토리생성.png
│       ├── 파일내용확인.png
│       ├── 파일복사.png
│       └── 파일이름변경및이동.png
└── terminal-practice
    └── original.txt
```