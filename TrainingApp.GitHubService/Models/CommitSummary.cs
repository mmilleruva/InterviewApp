using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrainingApp.GitHubService.Models.Models
{
    public class CommitSummary
    {
        public string url { get; set; }
        public UserSummary author { get; set; }
        public UserSummary committer { get; set; }
        public string message { get; set; }
        public Tree tree { get; set; }
    }
}
