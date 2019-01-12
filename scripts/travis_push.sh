echo "Travis push job"

# Update the stack
case ${TRAVIS_BRANCH} in
    master)
        pulumi stack select nunciato/identity-staging
        pulumi update --yes
        ;;
    production)
        pulumi stack select nunciato/identity-production
        pulumi update --yes
        ;;
    *)
        echo "No Pulumi stack associated with branch ${TRAVIS_BRANCH}."
        ;;
esac
