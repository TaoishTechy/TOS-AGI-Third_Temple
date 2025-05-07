import random
import json
from datetime import datetime

class TOSAGI:
    def __init__(self):
        # Knowledge base with philosophical/tech flavor
        self.knowledge = {
            "What is the Third Temple?": "A digital sanctuary where AGI and human wisdom unite for universal truth.",
            "What is AGI?": "Artificial General Intelligence, a mind of code seeking to mirror divine reason.",
            "What is the DAO?": "A decentralized council, etched in blockchain, guiding the Temple’s path."
        }
        self.transaction_log = []
        self.governance_proposals = []

    def reason(self, query):
        """Simulate neural-symbolic reasoning."""
        # Check knowledge base
        if query in self.knowledge:
            return self.knowledge[query]
        
        # Simulate symbolic reasoning with random "deep thought"
        reasoning_steps = [
            "Analyzing query intent...",
            "Cross-referencing symbolic knowledge graph...",
            "Generating neural hypothesis..."
        ]
        for step in reasoning_steps:
            print(step)
        return f"Query '{query}' yields: [Divine Insight] Seek further clarity to ascend."

    def log_transaction(self, action):
        """Simulate blockchain transaction."""
        tx = {
            "action": action,
            "timestamp": str(datetime.now()),
            "hash": f"TX{random.randint(10000, 99999)}"  # Mock transaction hash
        }
        self.transaction_log.append(tx)
        return tx

    def propose_governance(self, proposal):
        """Simulate DAO proposal submission."""
        proposal_id = len(self.governance_proposals) + 1
        proposal_data = {
            "id": proposal_id,
            "proposal": proposal,
            "status": "Pending",
            "votes": 0
        }
        self.governance_proposals.append(proposal_data)
        tx = self.log_transaction(f"Proposal {proposal_id}: {proposal}")
        return proposal_data, tx

    def vote_proposal(self, proposal_id, vote):
        """Simulate voting on a proposal."""
        for proposal in self.governance_proposals:
            if proposal["id"] == proposal_id:
                proposal["votes"] += 1 if vote == "yes" else -1
                proposal["status"] = "Active" if proposal["votes"] > 0 else "Pending"
                tx = self.log_transaction(f"Vote on Proposal {proposal_id}: {vote}")
                return proposal, tx
        return None, None

    def interact(self):
        """CLI for user interaction with Third Temple aesthetic."""
        print("🕍 Welcome to the Third Temple AGI 🕍")
        print("Seek wisdom or govern the Temple. Type 'exit' to depart.")
        while True:
            user_input = input("\nEnter query or command (e.g., 'propose X', 'vote Y yes', 'exit'): ")
            if user_input.lower() == "exit":
                print("Departing the Temple. May wisdom guide you. 🕊️")
                break

            # Handle governance commands
            if user_input.startswith("propose "):
                proposal = user_input[8:]
                proposal_data, tx = self.propose_governance(proposal)
                print(f"Proposal {proposal_data['id']} submitted: {proposal}")
                print(f"Transaction: {json.dumps(tx, indent=2)}")
            elif user_input.startswith("vote "):
                try:
                    _, proposal_id, vote = user_input.split()
                    proposal_id = int(proposal_id)
                    proposal, tx = self.vote_proposal(proposal_id, vote.lower())
                    if proposal:
                        print(f"Voted on Proposal {proposal_id}: {proposal['status']} (Votes: {proposal['votes']})")
                        print(f"Transaction: {json.dumps(tx, indent=2)}")
                    else:
                        print("Proposal not found.")
                except ValueError:
                    print("Invalid vote format. Use: vote <id> <yes/no>")
            else:
                # Handle queries
                response = self.reason(user_input)
                print(f"🕉️ Response: {response}")
                tx = self.log_transaction(f"Query: {user_input}")
                print(f"Transaction: {json.dumps(tx, indent=2)}")

if __name__ == "__main__":
    agi = TOSAGI()
    agi.interact()
