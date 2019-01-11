echo "Travis pull_request job"

# Download dependencies and build
# npm install
# npm run build

# Preview changes that would be made if the PR were merged.
case ${TRAVIS_BRANCH} in
    master)
        pulumi stack select nunciato/identity-stage
        pulumi preview
        ;;
    production)
        pulumi stack select nunciato/identity-prod
        pulumi preview
        ;;
    *)
        echo "No Pulumi stack targeted by pull request branch ${TRAVIS_BRANCH}."
        ;;
esac
