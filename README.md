# 사건 관제탑 대시보드

PDF·엑셀·CSV를 업로드하면 사건 목록을 인식하고 Supabase에 자동 저장하는 대시보드입니다.

## 최초 한 번만 설정

1. Supabase 프로젝트에서 **SQL Editor → New query**를 엽니다.
2. `supabase-setup.sql` 전체를 붙여넣고 **Run**을 누릅니다.
3. **Authentication → Users → Add user → Create new user**에서 로그인용 이메일과 비밀번호를 만듭니다.
4. GitHub 저장소의 **Settings → Pages**로 이동합니다.
5. **Build and deployment → Source**를 `Deploy from a branch`로 선택합니다.
6. Branch를 `main`, 폴더를 `/(root)`로 선택하고 **Save**를 누릅니다.
7. 잠시 후 표시되는 GitHub Pages 주소로 접속해 3번에서 만든 계정으로 로그인합니다.

## 사용 방법

- `PDF 업로드`: 특허·상표·디자인 문서를 읽고 확인창을 거쳐 목록에 추가합니다.
- `엑셀·CSV 업로드`: 인식된 분류의 기존 목록을 업로드 파일 내용으로 교체합니다.
- 행 클릭: 상태·기한·메모 등을 수정합니다.
- 모든 변경은 Supabase에 즉시 저장됩니다.
- 사건정보는 GitHub 저장소가 아니라 Supabase 데이터베이스에 저장됩니다.

## 보안

- Supabase의 anon key는 브라우저용 공개 식별키이며, 데이터 접근은 로그인과 RLS 정책으로 제한됩니다.
- `service_role` 키는 HTML이나 GitHub에 절대 넣지 마세요.
- 저장소가 공개되지 않도록 GitHub 저장소의 visibility를 Private으로 유지하는 것을 권장합니다.
